require 'test_helper'

class LoginControllerTest < ActionController::TestCase
  test "should_get_new" do
    get :new
    assert_response :success
  end

  test "should_not_login_user_if_incorrect" do
    post :create, email: "bob@example.com", password: "123"
    assert_redirected_to login_path
  end

  test "should_login_user_if_correct" do
    @user = users(:bob)
    assert_equal @user.password, "password"
    post :create, email: "bob@example.com", password: "password"
    assert_redirected_to root_path
  end
end
