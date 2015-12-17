require 'test_helper'

class UserLogsInWithTwitterTest < ActionDispatch::IntegrationTest

  test 'user can login with twitter and is redirected to root' do
    skip
    visit "/"
    assert_equal 200, page.status_code
    click_link "Login"
    assert_equal "/", current_path
    assert page.has_content?("Horace")
    assert page.has_link?("Logout")
  end


end
