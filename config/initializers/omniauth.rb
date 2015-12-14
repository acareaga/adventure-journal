Rails.application.config.middleware.use OmniAuth::Builder do
  provider :instagram, ENV["insta_client_id"], ENV["insta_secret_key"]
end
