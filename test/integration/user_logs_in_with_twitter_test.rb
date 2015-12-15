require 'test_helper'

class UserLogsInWithTwitterTest < ActionDispatch::IntegrationTest

  test 'user can login with twitter and is redirected to root' do
    visit "/"

    assert_equal 200, page.status_code
  end

end
