# == Schema Information
#
# Table name: opr_recommends
#
#  id          :integer          not null, primary key
#  product_id  :integer          not null
#  description :text(65535)
#  start_at    :datetime         not null
#  end_at      :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_opr_recommends_on_product_id           (product_id)
#  index_opr_recommends_on_start_at_and_end_at  (start_at,end_at)
#

class Opr::Recommend < ApplicationRecord
end
