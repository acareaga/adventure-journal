class User < ActiveRecord::Base

  def self.find_or_create(auth_info)
    user = User.find_or_create_by(uid: auth_info[:uid])
    user.oauth_token        = auth_info.credentials.token
    user.oauth_token_secret = auth_info.credentials.secret
    user.name               = auth_info.extra.raw_info.full_name
    user.bio                = auth_info.extra.raw_info.bio
    user.profile_picture    = auth_info.extra.raw_info.profile_picture
    user.username           = auth_info.extra.raw_info.username
    user.website            = auth_info.extra.raw_info.website
    user.save!
    user
  end
end
