class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.string :role
      t.string :email
      t.string :password_digest
      t.string :reset_password_token
      t.datetime :reset_password_token_expires_at

      t.timestamps
    end
  end
end