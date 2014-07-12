class StudentsController < ApplicationController

  def default_serializer_options
    {root: false}
  end

  def index
    @students = Student.all
    render json: @students
  end

  def show
    @student = Student.find(params[:id])

    render json: @student, serializer: StudentShowSerializer
  end

  def total_code
    student = Student.find(params[:id])
    @student_total_code = student.total_lines_code

    render json: @student_total_code
  end

  def total_language
    student = Student.find(params[:id])
    @student_languages = student.lines_per_language

    render json: @student_languages
  end

  private

  def student_params
    params.require(:student).permit(:firstname, :lastname, :username, :city, :session, :avatar_url, :url, :created_at)
  end

end
