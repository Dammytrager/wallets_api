module PaystackService::ApiModule
  extend ActiveSupport::Concern

  included do
    include HTTParty
    base_uri 'https://api.paystack.co'

    def self.headers
      secret_key = 'sk_test_5fd0d1d2c4d26883b937b31b7823fceef82b55e1' # your paystack secret key
      {
        'Authorization' => "Bearer #{secret_key}",
        'Content-Type' => 'application/json'
      }
    end
  end
end