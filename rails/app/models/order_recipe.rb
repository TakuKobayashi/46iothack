# == Schema Information
#
# Table name: order_recipes
#
#  id            :integer          not null, primary key
#  user_id       :integer          not null
#  token         :string(255)      not null
#  qr_image_path :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_order_recipes_on_token    (token) UNIQUE
#  index_order_recipes_on_user_id  (user_id)
#

class OrderRecipe < ApplicationRecord
  before_create do
    self.token = SecureRandom.hex
  end
end
