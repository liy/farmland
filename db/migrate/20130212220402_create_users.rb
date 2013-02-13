class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, null: false, unique: true
      t.string :name, null: false
      t.string :password_digest, null: false
      t.string :avatar

      # if presence, not activated
      t.string :activation_token
      # random token for password reset
      t.string :password_reset_token

      t.timestamps
    end

    add_index :users, :email
  end
end
