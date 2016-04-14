require 'test_helper'

class LoginLogoutTest < ActionDispatch::IntegrationTest
  test "login_page_works" do
    get root_path
    assert_redirected_to login_path
    follow_redirect!
    assert_template "new"
    post login_path, email: "gibberish@example.com", password: "(&*GFYIB)"
    assert_redirected_to login_path
    post login_path, email: "bob@example.com", password: "password"
    assert_redirected_to root_path
    follow_redirect!
    assert_select "a[href=?]", logout_path, 1
  end
end
