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

   