class SearchController < ApplicationController
  
  # Search in the name of the school.
  # GET /schools_search/:params
  def schools_search
    @schools = School.search(params[:params])
    
    unless @schools.blank?
      render json: @schools
    else
      render json: @schools, status: :no_content
    end
  end
  
  # Search in the name of the students.
  # GET /schools_search/:params
  def students_search
    @students = Student.search(params[:params])
    
    unless @students.blank?
      render json: @students
    else
      render json: @students, status: :no_content
    end
  end
  
  # Search in the name of teachers.
  # GET /schools_search/:params
  def teachers_search
    @teachers = Teacher.search(params[:params])
    
    unless @teachers.blank?
      render json: @teachers
    else
      render json: @teachers, status: :no_content
    end
  end
end