require 'test_helper'

class StudentsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success

    assert_select "form"
  end

  test "should get show" do
    @bob = students(:bob)
    get :show, id: @bob.id
    assert_response :success
  end

  test "should get edit" do
    @bob = students(:bob)
    get :edit, id: @bob.id
    assert_response :success
    assert_select "form"
  end

  test "should get update" do
    @bob = students(:bob)
    patch :update, id: @bob.id, student: { name: "Jill Jones" }
    assert_redirected_to controller: "students", action: "show", id: @bob.id

    assert_equal "Jill Jones", assigns[:student].name
  end

  test "should get create" do
    prev_student_count = Student.count
    post :create, student: { name: "Bob James" }
    assert assigns(:student).valid?
    assert_equal "Bob James", assigns(:student).name
    assert_equal prev_student_count + 1, Student.count
    assert_redirected_to controller: "students", action: "show", id: assigns(:student).id
  end

  test "should get delete" do
    @bob = students(:bob)
    prev_student_count = Student.count
    delete :destroy, id: @bob.id
    assert_redirected_to controller: "students", action: "index"
    assert_equal prev_student_count - 1, Student.count
  end
end
