class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, null: false, unique: true
      t.string :name, null: false
      t.string :password_digest, null: false
      t.string :avatar

      # for remember me feature
      t.string :auth_token, unique: true

      # if presence, not activated
      t.string :activation_token

      # random token for password reset
      t.string :password_reset_token
      t.datetime :password_reset_sent_at

      t.timestamps
    end

    add_index :users, :email
  end
end
