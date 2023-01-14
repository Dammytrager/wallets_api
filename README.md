### Wallets App

___

Basic Wallets Application running entorey on an API, A user will own a wallet and will be able fund the wallet via a debit card that will belong the user and send money put of the wallet to other banks.

- Data Models

    - User - `first_name`, `last_name`, `email`, `dob`, `address`, `auth_token`, `password`, `timestamps`

    - Wallet - `user_id`

    - Transaction - `wallet_id`, `amount`, `txn_type`, `status`
      `status`

        - `status_pending`
        - `status_success`
        - `status_cancelled`

      `txn_type`

        - `txn_type_debit`
        - `txn_type_credit`

    - External Call - `request_body`, `response_body`, `transaction_id`, `url`, `method`, `request_heraders`, `response_headers`

    - DebitCard