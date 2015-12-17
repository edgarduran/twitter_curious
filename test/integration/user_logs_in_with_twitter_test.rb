require 'test_helper'

class UserLogsInWithTwitterTest < ActionDispatch::IntegrationTest

  test 'user can login with twitter and is redirected to root' do
    VCR.use_cassette('user_login') do
      visit "/"
      assert_equal 200, page.status_code
      click_link "Login"
      assert_equal "/", current_path
      click_link "Get Tweeting"
      assert page.has_content?("Horace")
      assert page.has_link?("Logout")
    end
  end


end
