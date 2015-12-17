require 'test_helper'

class MediaTest < ActiveSupport::TestCase

  test "you can retrieve a user's posts" do
    VCR.use_cassette("media#user_posts", :record => :new_episodes) do
      posts = Media.user_posts(users(:one))
      post = posts.first

      assert_equal "aaronturing", post.user.username
      assert_equal "Snowing hard!", post.caption.text
      assert_equal 0, post.likes[:count]
      assert_equal "A-Basin Ski & Snowboard Area", post.location.name
    end
  end

  test "you can search posts by tag" do
    VCR.use_cassette("media#search_by_tag", :record => :new_episodes) do
      posts = Media.search_by_tag(users(:one), "colorado")
      post = posts.first

      assert_equal "powskiing", post.user.username
      assert_equal "berner spotted at the basin 😍 #bmd #skicolorado #getoutside #berner #colorado #abasin", post.caption.text
      assert_equal 40, post.likes[:count]
      assert_equal "Arapahoe Basin", post.location.name
    end
  end
end
