class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email, null: false
      t.string :auth_token
      t.string :dob
      t.string :address
      t.string :password_digest

      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end
