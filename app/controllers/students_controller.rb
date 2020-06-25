class StudentsController < ApplicationController
  before_action :find_student, only: [:show, :edit, :update]

  def index
    @students = Student.all
  end

  def show
  end

  def new
    @student = Student.new
  end 

  def edit
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to instructor_path(@student.instructor)
    else
      flash[:errors] = @student.errors.full_messages
      render :new
    end
  end

  def update
    if @student.update(student_params)
      redirect_to student_path(@student)
    else
      flash[:errors] = @student.errors.full_messages
      render :edit
    end
  end 

  private

  def find_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:name, :major, :age, :instructor_id)
  end
  
end
