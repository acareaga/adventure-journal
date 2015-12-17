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
    assert page.has_link?("logout")
  end

  def stub_omniauth
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:instagram] = OmniAuth::AuthHash.new({
      "provider"=>"instagram",
      "uid"=>"2331596714",
      "info"=>{
        "nickname"=>"aaronturing",
        "name"=>"Aaron",
        "email"=>nil,
        "image"=>"https://scontent.cdninstagram.com/hphotos-xtp1/t51.2885-19/s150x150/12338859_189639354716935_1184283222_a.jpg",
        "bio"=>"Turing test",
        "website"=>""},
      "credentials"=>{"token"=>"2331596714.2dd2c36.bd9e537a6ecc4b6ea85b0cc9f22a5779", "expires"=>false},
      "extra"=>{
        "raw_info"=>{
          "username"=>"aaronturing",
          "bio"=>"Turing test",
          "website"=>"",
          "profile_picture"=>"https://scontent.cdninstagram.com/hphotos-xtp1/t51.2885-19/s150x150/12338859_189639354716935_1184283222_a.jpg",
          "full_name"=>"Aaron",
          "id"=>"2331596714"
          }}})
  end
end
