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

class Product < ApplicationRecord
  enum category: {
    mazuhakore: 1,
    salad: 2,
    sashimi: 3,
    skewers: 4,
    pottery: 5,
    umaimono: 6,
    fried: 7,
    teppanyaki: 8,
    pizza: 9,
    meal: 10,
    dessert: 11,
    bakuhai: 12,
    beer: 13,
    highball: 14,
    whiskey: 15,
    sour: 16,
    fresh_sour: 17,
    limoncello: 18,
    cocktail: 19,
    fruit_liquor: 20,
    makgeoli: 21,
    distilled_spirits: 22,
    drink_ingredient: 23,
    plum_wine: 24,
    sake: 25,
    wine: 26,
    soft_drink: 27,
  }

  def self.lot_planning(params: {})
    category_foods = Food.all.group_by(&:category)
    results = category_foods.map do |c, fs|
      food = fs.sample
      fa = food.attributes
      fa.merge!({
        category: Product.categories[food.category],
        category_name: I18n.t("activerecord.enum.product.category.#{food.category}"),
      })
    end
    return results
  end
end
