class Api::DebitCardsController < ApiController
  before_action :authenticate
  before_action :set_wallet

  def create
    transaction = @wallet.create_credit_transaction(1, save: false, skip_source: true)

    response = PaystackService::DebitCard.charge(transaction: transaction, card: card_params)
    parse_paystack_response(response)
  end

  def send_pin
    response = PaystackService::DebitCard.submit_pin(
      transaction_ref: params.require(:reference), pin: params.require(:pin)
    )
    parse_paystack_response(response)
  end

  def send_otp
    response = PaystackService::DebitCard.submit_otp(
      transaction_ref: params.require(:reference), otp: params.require(:otp)
    )
    parse_paystack_response(response)
  end

  def destroy
  end

  def card_params
    {
      card: {
        cvv: params.require(:cvv),
        number: params.require(:number),
        expiry_month: params.require(:expiry_month),
        expiry_year: params.require(:expiry_year)
      }
    }
  end

  def set_wallet
    @wallet = @user.wallet
  end

  def parse_paystack_response(response)
    if response['status'] == false
      return render json: { message: response['message'] }, status: :bad_request
    elsif response['data']['status'] == 'success'
      # create the debit card
      card_details = response['data']['authorization'].slice(
        'authorization_code', 'last4', 'exp_month', 'exp_year',
        'bank', 'card_type'
      )
      debit_card = DebitCard.create(
        **card_details,
        user: @user
      )

      return render json: {
        message: 'Debit Card Created Successfully',
        data: JSON(debit_card.to_json).except('authorization_code')
      }, status: :ok
    else
      return render json: response['data']
    end
  end
end