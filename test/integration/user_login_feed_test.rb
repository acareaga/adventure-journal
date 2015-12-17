require './test/test_helper'

class UserLoginFeedTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  def setup
    Capybara.app = AdventureJournal::Application
    stub_omniauth
  end

  test "user can login and see feed of tagged photos" do
    VCR.use_cassette("feed#index") do
      visit "/"

      assert_equal 200, page.status_code

      click_link "login"
      click_link "AdventureJournal"

      within("#berners-love-snow-days-cowx-denver-berner-bernesemountaindog-snowday") do
        assert page.has_content?("powskiing")
        assert page.has_content?("Favorites: 25")
        assert page.has_content?("Comments: 0")
        assert page.has_content?("Berners love snow days")
      end

      assert_equal "/", current_path
      assert page.has_link?("aaronturing")
      assert page.has_link?("logout")
    end
  end

  # test "user can search photos by tag" do
  #   VCR.use_cassette("feed#show") do
  #     visit "/"
  #
  #     click_link "login"
  #     click_link "AdventureJournal"
  #
  #     within "#search-field" do
  #       fill_in("#search-box", with: "skiing").send_keys(:return)
  #     end
  #
  #     within("#berners-love-snow-days-cowx-denver-berner-bernesemountaindog-snowday") do
  #       assert page.has_content?("powskiing")
  #       assert page.has_content?("Favorites: 25")
  #       assert page.has_content?("Comments: 0")
  #       assert page.has_content?("Berners love snow days")
  #     end
  #   end
  # end
end
