# == Schema Information
#
# Table name: oauth_accounts
#
#  id           :integer          not null, primary key
#  user_id      :integer          not null
#  type         :string(255)      not null
#  uid          :string(255)      not null
#  token        :string(255)
#  token_secret :string(255)
#  expired_at   :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_oauth_accounts_on_uid               (uid)
#  index_oauth_accounts_on_user_id_and_type  (user_id,type) UNIQUE
#

class FacebookAccount < OauthAccount
end
