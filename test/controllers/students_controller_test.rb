require 'test_helper'
class StudentsControllerTest < ActionController::TestCase
  setup do
    @user = users(:jill)
    # Set the session for the upcoming requests
    session[:user_id] = @user.id
  end

  test "shouldgetindex" do
    get :index, nil
    assert_response :success
  end

  test "should_get_new" do
    get :new, nil
    assert_response :success

    assert_select "form"
  end

  test "should_get_show" do
    @bob = students(:bob)
    get :show, { id: @bob.id }
    assert_response :success
  end

  test "should_get_edit" do
    @bob = students(:bob)
    get :edit, id: @bob.id
    assert_response :success
    assert_select "form"
  end

  test "should_get_update" do
    @bob = students(:bob)
    patch :update, id: @bob.id, student: { name: "Jill Jones" }
    assert_redirected_to controller: "students", action: "show", id: @bob.id

    assert_equal "Jill Jones", assigns[:student].name
  end

  test "should_get_create" do
    prev_student_count = Student.count
    post :create, student: { name: "Bob James" }
    assert assigns(:student).valid?
    assert_equal "Bob James", assigns(:student).name
    assert_equal prev_student_count + 1, Student.count
    assert_redirected_to controller: "students", action: "show", id: assigns(:student).id
  end

  test "should_get_delete" do
    @bob = students(:bob)
    prev_student_count = Student.count
    delete :destroy, id: @bob.id
    assert_redirected_to controller: "students", action: "index"
    assert_equal prev_student_count - 1, Student.count
  end
end
