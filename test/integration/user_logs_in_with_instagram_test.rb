require "test_helper"

class UserLogsInWithInstagramTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  def setup
    Capybara.app = AdventureJournal::Application
    stub_omniauth
  end

  test "logging in" do
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
