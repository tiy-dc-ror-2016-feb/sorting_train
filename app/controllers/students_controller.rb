class StudentsController < ApplicationController
  before_action :authenticate!

  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def show
    @student = Student.find(params[:id])
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])
    @student.update(student_params)

    redirect_to action: "show", id: @student.id
  end

  def create
    @student = Student.create(student_params)

    redirect_to action: "show", id: @student.id
  end

  def destroy
    Student.find(params[:id]).destroy
    redirect_to action: "index"
  end

  def pick
    @student = Student.fairly_pick
    redirect_to action: "show", id: @student.id
  end

  private

  def student_params
    params.require(:student).permit(:name, :photo_url, :password_confirmation)
  end

  def authenticate!
    redirect_to(login_path) unless current_user
  end
end
