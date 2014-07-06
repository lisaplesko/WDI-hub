class StudentsController < ApplicationController

  def default_serializer_options
    {root: false}
  end

  def index
    @students = Student.all

    render json: @students
  end

  # GET /students/1
  # GET /students/1.json
  def show
    @student = Student.find(params[:id])

    render json: @student
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(student_params)

    if @student.save
      render json: @student, status: :created, location: @student
    else
      render json: @student.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    @student = Student.find(student_params[:id])

    if @student.update(student_params[:student])
      head :no_content
    else
      render json: @student.errors, status: :unprocessable_entity
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student = Student.find(params[:id])
    @student.destroy

    head :no_content
  end

  private

  def student_params
    params.require(:student).permit(:firstname, :lastname, :username, :city, :session, :avatar_url, :url)
  end

end
