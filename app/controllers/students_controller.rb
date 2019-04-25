class StudentsController < ApplicationController
  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params(:first_name, :last_name))
    @student.save
    #binding.pry
    redirect_to @student
  end

  def update
    @student = Student.find(params[:id])
    @student.update(student_params(:first_name, :last_name))
    redirect_to @student
  end

  def edit
    @student = Student.find(params[:id])
  end

  private

  def student_params(*args)
    params.require(:student).permit(*args)
  end
end
