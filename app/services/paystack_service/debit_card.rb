class PaystackService::DebitCard
  include HTTParty
  base_uri 'https://api.paystack.co'

  def self.headers
    {
      'Authorization' => 'Bearer sk_test_5fd0d1d2c4d26883b937b31b7823fceef82b55e1',
      'Content-Type' => 'application/json'
    }
  end

  def self.charge(transaction:, card: nil, authorization: nil, pin: nil)
    body = {
      email: transaction.user.email,
      amount: transaction.amount * 100,
      reference: transaction.txn_ref
    }
    body.merge!(card) if card.present?
    body.merge!(authorization) if authorization.present?
    body.merge!({pin: pin}) if pin.present?

    self.post("/charge", body: body.to_json, headers: headers).parsed_response
  end

  def self.submit_pin(transaction_ref:, pin:)
    body = {
      pin: pin,
      reference: transaction_ref
    }

    self.post("/charge/submit_pin", body: body.to_json, headers: headers).parsed_response
  end

  def self.submit_otp(transaction_ref:, otp:)
    body = {
      otp: otp,
      reference: transaction_ref
    }

    self.post("/charge/submit_otp", body: body.to_json, headers: headers).parsed_response
  end
end