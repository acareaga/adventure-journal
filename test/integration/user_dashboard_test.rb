require 'test_helper'

class UserDashboardTest < ActionDispatch::IntegrationTest

  test "User can access dashboard and see profile data" do
    login_user

    click_link "Powskiing"

    assert page.has_content?("Profile Picture")
    assert page.has_content?("About Me")
    assert page.has_content?("Followers")
    assert page.has_content?("Following")
    assert page.has_content?("Posts")
  end

  test "User sees most recent posts below profile" do
    skip
    login_user

    click_link "Powskiing"

    assert page.has_content?("Today was fun #skicolorado")
    assert page.has_content?("Dumping along the front range #powderday")
    assert page.has_content?("Hope everyone is having a great Thanksgiving!")
    assert page.has_content?("Load More")
  end
end
