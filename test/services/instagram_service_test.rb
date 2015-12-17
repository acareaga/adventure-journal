require './test/test_helper'

class InstagramServiceTest < ActiveSupport::TestCase
  attr_reader :service

  # def setup
  #   @service = InstagramService.new(user)
  # end
  #
  # test "#user_posts" do
  #   VCR.use_cassette("instagram_service#user_posts") do
  #     post = service.posts.first
  #
  #     assert_equal "powskiing", post.user.username
  #     assert_equal "0", post.likes.count
  #     assert_equal "sadfsdf", post.caption.text
  #     assert_equal "0", post.comments.count
  #   end
  # end
end
