require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  test "you can create a user with valid attributes" do
    user = User.create(  username:           "lolabeans",
                  name:               "Lola",
                  bio:                "Woof",
                  profile_picture:    "http://www.google.com",
                  website:            "google.com",
                  oauth_token:        "1233123211231321233212"
                )

    assert_equal "Lola", user.name
    assert_equal "Woof", user.bio
    assert_equal "1233123211231321233212", user.oauth_token
  end

  test "you can find an existing user in the database" do
    user = users(:one)

    assert_equal 980190962, user.id
    assert_equal "Aaron", user.name
    assert user.oauth_token
    refute user.oauth_token_secret
  end
end
