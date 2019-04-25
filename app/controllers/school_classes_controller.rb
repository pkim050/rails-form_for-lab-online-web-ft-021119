class SchoolClassesController < ApplicationController
  def index
    @schoolclasses = SchoolClass.all
  end

  def show
    @schoolclass = SchoolClass.find(params[:id])
  end

  def new
    @schoolclass = SchoolClass.new
  end

  def create
    @schoolclass = SchoolClass.new(school_class_params(:title, :room_number))
    @schoolclass.save
    redirect_to @schoolclass
  end

  def update
    @schoolclass = SchoolClass.find(params[:id])
    @schoolclass.update(school_class_params(:room_number))
    redirect_to @schoolclass
  end

  def edit
  end

  private

  def school_class_params(*args)
    params.require(:school_student).permit(*args)
  end
end
