class StudentsController < ApplicationController
  def index
  end

  def new
  end

  def show
  end

  def edit
  end

  def update
    redirect_to action: "show", id: 1
  end

  def create
    @student = Student.create(params[:student].permit!)

    redirect_to action: "show", id: @student.id
  end

  def destroy
    redirect_to action: "index"
  end
end
