require './test/test_helper'

class UserLoginDashboardTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  def setup
    Capybara.app = AdventureJournal::Application
    stub_omniauth
  end

  test "user can login and see dashboard of recent photos" do
    VCR.use_cassette("dashboard#show") do
      visit "/"

      assert_equal 200, page.status_code

      click_link "login"

      assert_equal "/aaronturing", current_path
      assert page.has_content?("aaronturing")
      assert page.has_content?("Aaron - Turing test")
      assert page.has_link?("aaronturing")
      assert page.has_link?("logout")
    end
  end
end
