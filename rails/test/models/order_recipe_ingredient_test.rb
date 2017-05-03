# == Schema Information
#
# Table name: order_recipe_ingredients
#
#  id              :integer          not null, primary key
#  user_id         :integer          not null
#  order_recipe_id :integer          not null
#  product_id      :integer          not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_order_recipe_ingredients_on_order_recipe_id  (order_recipe_id)
#  index_order_recipe_ingredients_on_product_id       (product_id)
#  index_order_recipe_ingredients_on_user_id          (user_id)
#

require 'test_helper'

class OrderRecipeIngredientTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
