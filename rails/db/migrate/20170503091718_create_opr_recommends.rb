class CreateOprRecommends < ActiveRecord::Migration[5.0]
  def change
    create_table :opr_recommends do |t|
      t.integer :product_id, null: false
      t.text :description
      t.datetime :start_at, null: false
      t.datetime :end_at
      t.timestamps
    end
    add_index :opr_recommends, :product_id
    add_index :opr_recommends, [:start_at, :end_at]
  end
end
