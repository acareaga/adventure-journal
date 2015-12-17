require './test/test_helper'

class InstagramServiceTest < ActiveSupport::TestCase
  attr_reader :service

  def setup
    @service = InstagramService.new(users(:one))
  end

  test "#dashboard" do
    VCR.use_cassette("instagram_service#user_posts") do
      post = service.user_posts.first

      assert_equal "aaronturing", post.user.username
      assert_equal "Aaron", post.user.full_name
      assert_equal "Snowing hard!", post.caption.text
      assert_equal 1, post.likes.count
      assert_equal 1, post.comments.count
    end
  end

  test "#feed" do
    VCR.use_cassette("instagram_service#search_by_tag") do
      post = service.search_by_tag('berner').first

      assert_equal "powskiing", post.caption.from.username
      assert_equal "Aaron Careaga", post.caption.from.full_name
      assert_equal "Berners love snow days #cowx #denver #berner #bernesemountaindog #snowday", post.caption.text
      assert_equal 1, post.likes.count
      assert_equal 1, post.comments.count
    end
  end
end
