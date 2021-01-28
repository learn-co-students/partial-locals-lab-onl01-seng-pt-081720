class StudentsController < ApplicationController
  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to @student
    else
      render 'new'
    end
  end

  def edit
    @student = Student.find(params[:id])
  end

  def show
    @student = Student.find(params[:id])
  end

  def index
    # @students = Student.all
    #add search functionality - 1) grab the param for it
      # params[:query]
    # 2) search the database
      # results = Student.where( "name LIKE ?", "%%" )
      # if params[:query].present?
      
      # else
      # @students = Student.all
      # end
    # 3) load this page with the returned matching data
      # render 'index'
      
    #  raise params.inspect
      @students = Student.search(params[:query])

  end

  def student_params
    params.require(:student).permit(:name, :birthday, :hometown)
  end
end
