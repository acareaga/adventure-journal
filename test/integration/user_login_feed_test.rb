require './test/test_helper'

class UserLoginFeedTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  def setup
    Capybara.app = AdventureJournal::Application
    stub_omniauth
  end

  test "user can login and see feed of tagged photos" do
    VCR.use_cassette("feed#show") do
      visit "/"

      assert_equal 200, page.status_code

      click_link "login"
      click_link "AdventureJournal"

      assert_equal "/", current_path
      assert page.has_content?("Search")
      assert page.has_link?("aaronturing")
      assert page.has_link?("logout")
    end
  end
end
