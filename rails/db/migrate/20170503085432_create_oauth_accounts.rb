class CreateOauthAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :oauth_accounts do |t|
      t.integer :user_id, null: false
      t.string :type, null: false
      t.string :uid, null: false
      t.string :token
      t.string :token_secret
      t.datetime :expired_at
      t.timestamps
    end
    add_index :oauth_accounts, [:user_id, :type], unique: true
    add_index :oauth_accounts, :uid
  end
end
