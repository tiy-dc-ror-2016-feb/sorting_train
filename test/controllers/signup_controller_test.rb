require 'test_helper'

class SignupControllerTest < ActionController::TestCase
  test "should_get_new" do
    get :new
    assert_response :success
  end

  test "should_create_new_user" do
    assert_difference "User.count", +1 do
      # Create a new user with a unique email
      post :create, user: { email: "joe@example.com", password: "123", password_confirmation: "123" }
      assert_response :redirect
    end
  end
end
