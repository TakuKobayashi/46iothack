class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.string :type, null: false
      t.integer :category, null: false
      t.integer :price, null: false, default: 0
      t.integer :price_in_tax, null: false, default: 0
      t.integer :kcal, null: false, default: 0
      t.string :image_path
    end

    add_index :products, [:category, :type]
  end
end
