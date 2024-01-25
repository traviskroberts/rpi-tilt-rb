class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      # Authlogic::ActsAsAuthentic::Email
      t.string :email
      t.index :email, unique: true

      # Authlogic::ActsAsAuthentic::Password
      t.string :crypted_password
      t.string :password_salt

      # Authlogic::ActsAsAuthentic::PersistenceToken
      t.string :persistence_token
      t.index :persistence_token, unique: true

      t.timestamps
    end
  end
end
