class FeedController < ApplicationController

  # access_token: "1920933334.2dd2c36.a389d8190cc44913b7025475a5340e63"

  # $ curl -F 'client_id=2dd2c36619fc4924bf4d70b7df40091c' \
  # > -F 'client_secret=17878ae5993b483095fdc84a54c367b7' \
  # > -F 'grant_type=authorization_code' \
  # > -F 'redirect_uri=http://127.0.0.1:3000/auth/instagram/callback' \
  # > -F 'code=7851422c289447c5b0d95f0c1acb9738' \
  # > https://api.instagram.com/oauth/access_token


  def show
    client = Instagram.client(:access_token => session[:access_token])
    @user = client.user
  end
end
