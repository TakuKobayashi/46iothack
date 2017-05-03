class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :token, null: false
      t.string :email
      t.string :password
      t.timestamps
    end
    add_index :users, :token, unique: true
    add_index :users, :email
  end
end
