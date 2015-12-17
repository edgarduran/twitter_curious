require 'test_helper'

class UserSeesDashboardWithProfileTest < ActionDispatch::IntegrationTest
  test 'user sees dashboard with profile name user_name and other info' do
    skip
    visit '/'
    click_link "Login"

    click_link "Get Tweeting"

    assert page.has_content?("Horace")
    assert page.has_content?("Worace")
    assert page.has_link?("Logout")
  end
end
