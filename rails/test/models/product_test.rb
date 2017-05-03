# == Schema Information
#
# Table name: products
#
#  id           :integer          not null, primary key
#  name         :string(255)      not null
#  type         :string(255)      not null
#  category     :integer          not null
#  price        :integer          default("0"), not null
#  price_in_tax :integer          default("0"), not null
#  kcal         :integer          default("0"), not null
#  image_path   :string(255)
#
# Indexes
#
#  index_products_on_category_and_type  (category,type)
#

require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
