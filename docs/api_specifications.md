#### Wallets API specification

___

1. Create User

   **Request**
   Url - `/api/users`

   Method - `POST`
   Request body

   ```json
   {
     "first_name": "string",
     "last_name": "string",
     "email": "string",
     "password": "string"
   }
   ```

   **Response**

   Status - `201 - created`

   body

   ```json
   {
     "message": "User created successfully"
   }
   ```

2. Update user

   **Request**
   Url - `/api/users`

   Method - `PATCH`
   Headers - `{Authorization: 'Bearer <token>'}`

   Request body

   ```json
   {
     "first_name": "string",
     "last_name": "string",
     "email": "string",
     "password": "string",
     "dob": "string",
     "address": "string"
   }
   ```

   **Response**

   Status - `200 - OK`

   body

   ```json
   {
     "message": "User updated successfully",
     "data": {
       "first_name": "string",
       "last_name": "string",
       "email": "string",
       "password": "string",
       "dob": "string",
       "address": "string",
       "created_at": "timestamp",
       "updated_at": "timestamp"
     }
   }
   ```

3. Login

   **Request**
   Url - `/api/sessions`

   Method - `POST`

   Request body

   ```json
   {
     "email": "string",
     "password": "string"
   }
   ```

   **Response**

   Status - `200 - OK`

   body

   ```json
   {
     "message": "login successful",
     "data": {
       "first_name": "string",
       "last_name": "string",
       "email": "string",
       "password": "string",
       "dob": "string",
       "address": "string",
       "created_at": "timestamp",
       "updated_at": "timestamp",
       "auth_token": "string"
     }
   }
   ```

4. Wallet Details

   **Request**
   Url - `/api/wallets`

   Method - `GET`

   Headers - `{Authorization: 'Bearer <token>'}`

   **Response**

   Status - `200 - OK`

   body

   ```json
   {
     "data": {
       "user_id": "string",
       "settled_balance": "string",
       "status": "string",
       "recent_transactions": []
     }
   }
   ```

5. Create Debit Cards

   **Request**
   Url - `/api/debit_cards`

   Method - `POST`

   Headers - `{Authorization: 'Bearer <token>'}`

   body

   ```json
   {
     "cvv": "string",
     "number": "string",
     "expiry_month": "string",
     "expiry_year": "string"
   }
   ```



**Response**

Status - `200 - OK`

body

   ```json
   // When charged
   {
     "message": "debit card added successfully",
     "data": {
       "id": "string", 		
       "last4": "string", 
       "exp_month": "string", 
       "exp_year": "string", 
       "card_type": "string", 
       "bank": "string", 
       "user_id": "string", 
       "created_at": "string", 
       "updated_at": "string"
     }
   }
   
   // When Pin is required
   {
       "reference": "guiajjfxvpx9vwd",
       "status": "send_pin"
   }
   
   // When Otp is required
   {
       "reference": "guiajjfxvpx9vwd",
       "status": "send_otp"
   }
   ```

6. Send Pin

   **Request**
   Url - `/api/debit_cards`/send_pin

   Method - `POST`

   Headers - `{Authorization: 'Bearer <token>'}`

   body

   ```json
   {
     "reference": "string",
      "pin": "string"
   }
   ```



**Response**

Status - `200 - OK`

body

   ```json
   // When charged
   {
     "message": "debit card added successfully",
     "data": {
       "id": "string", 		
       "last4": "string", 
       "exp_month": "string", 
       "exp_year": "string", 
       "card_type": "string", 
       "bank": "string", 
       "user_id": "string", 
       "created_at": "string", 
       "updated_at": "string"
     }
   }
   
   // When Otp is required
   {
       "reference": "guiajjfxvpx9vwd",
       "status": "send_otp"
   }
   ```

7. Send OTP

   **Request**
   Url - `/api/debit_cards`/send_pin

   Method - `POST`

   Headers - `{Authorization: 'Bearer <token>'}`

   body

   ```json
   {
     "reference": "string",
     "otp": "string"
   }
   ```



**Response**

Status - `200 - OK`

body

   ```json
   // When charged
   {
     "message": "debit card added successfully",
     "data": {
       "id": "string", 		
       "last4": "string", 
       "exp_month": "string", 
       "exp_year": "string", 
       "card_type": "string", 
       "bank": "string", 
       "user_id": "string", 
       "created_at": "string", 
       "updated_at": "string"
     }
   }
   ```

   