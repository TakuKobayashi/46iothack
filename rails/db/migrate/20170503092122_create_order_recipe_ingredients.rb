class CreateOrderRecipeIngredients < ActiveRecord::Migration[5.0]
  def change
    create_table :order_recipe_ingredients do |t|
      t.integer :user_id, null: false
      t.integer :order_recipe_id, null: false
      t.integer :product_id, null: false
      t.timestamps
    end
    add_index :order_recipe_ingredients, :user_id
    add_index :order_recipe_ingredients, :order_recipe_id
    add_index :order_recipe_ingredients, :product_id
  end
end
