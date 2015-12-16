class User < ActiveRecord::Base
  
  def self.find_or_create(auth_info)
    user = User.find_or_create_by(uid: auth_info[:uid])
    user.update_attributes(
      username:           auth_info.extra.raw_info.username,
      name:               auth_info.extra.raw_info.full_name,
      bio:                auth_info.extra.raw_info.bio,
      profile_picture:    auth_info.extra.raw_info.profile_picture,
      website:            auth_info.extra.raw_info.website,
      oauth_token:        auth_info.credentials.token,
      oauth_token_secret: auth_info.credentials.secret
    )
    user
  end
end
