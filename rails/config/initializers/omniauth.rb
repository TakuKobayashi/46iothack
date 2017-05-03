api_config = YAML.load(File.read(Rails.root.to_s+ "/config/apiconfig.yml"))
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, api_config["facebook"]["app_id"], api_config["facebook"]["app_secret"], :scope => 'email,public_profile,user_friends'
  provider :twitter, api_config["twitter"]["consumer_key"], api_config["twitter"]["consumer_secret"]
end