class PaystackService::DebitCard
  include HTTParty
  base_uri 'https://api.paystack.co'

  def self.headers
    {
      'Authorization' => 'Bearer ',
      'Content-Type' => 'application/json'
    }
  end

  def self.charge(transaction:, card: nil, authorization: nil, pin: nil)
    body = {
      email: transaction.user.email,
      amount: transaction.amount * 100,
      ref: transaction.txn_ref
    }
    body.merge!(card) if card.present?
    body.merge!(authorization) if authorization.present?
    body.merge!({pin: pin}) if pin.present?

    self.post("/charge", body: body.to_json, headers: headers)
  end
end