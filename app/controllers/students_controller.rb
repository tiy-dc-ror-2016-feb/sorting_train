class StudentsController < ApplicationController
  def index
    @students = Student.all
  end

  def new
  end

  def show
    @student = Student.find(params[:id])
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])
    @student.update(params[:student].permit!)

    redirect_to action: "show", id: @student.id
  end

  def create
    @student = Student.create(params[:student].permit!)

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
end
