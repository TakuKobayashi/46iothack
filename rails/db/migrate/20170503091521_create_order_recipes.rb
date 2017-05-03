class CreateOrderRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :order_recipes do |t|
      t.integer :user_id, null: false
      t.string :token, null: false
      t.string :qr_image_path
      t.timestamps
    end
    add_index :order_recipes, :token, unique: true
    add_index :order_recipes, :user_id
  end
end
