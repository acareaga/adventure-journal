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
    assert_equal "/", current_path
    assert page.has_content?("powskiing")
    assert page.has_link?("logout")
  end

  def stub_omniauth
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:instagram] = OmniAuth::AuthHash.new({
      provider: 'instagram',
      extra: {
        raw_info: {
          user_id: "1234",
          name: "Aaron",
          screen_name: "powskiing",
        }
      },
      credentials: {
        token: "pizza",
        secret: "secretpizza"
      }
    })
  end
end
