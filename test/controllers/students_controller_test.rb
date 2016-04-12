require 'test_helper'

class StudentsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get show" do
    get :show, id: 1
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: 1
    assert_response :success
  end

  test "should get update" do
    patch :update, id: 1
    assert_redirected_to controller: "students", action: "show", id: 1
  end

  test "should get create" do
    prev_student_count = Student.count
    post :create, student: { name: "Bob" }
    assert assigns(:student).valid?
    assert_equal "Bob", assigns(:student).name
    assert_equal prev_student_count + 1, Student.count
    assert_redirected_to controller: "students", action: "show", id: assigns(:student).id
  end

  test "should get delete" do
    delete :destroy, id: 1
    assert_redirected_to controller: "students", action: "index"
  end
end
