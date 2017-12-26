class SchoolsController < ApplicationController
  before_action :set_school, only: [:show, :update, :destroy]
  
  # GET /schools
  def index
    @schools = School.all
    
    render json: @schools
  end
  
  # SchoolWorker is a BackgroudJob with Redis and Sidekiq.
  # GET /schools/1
  def show
    SchoolWorker.perform_async(@school.id, @school.name, @school.cnpj)
    render json: @school
  end
  
  # POST /schools
  def create
    @school = School.new(school_params)
    
    if @school.save
      render json: @school, status: :created, location: @school
    else
      render json: @school.errors, status: :unprocessable_entity
    end
  end
  
  # PATCH/PUT /schools/1
  def update
    if @school.update(school_params)
      render json: @school
    else
      render json: @school.errors, status: :unprocessable_entity
    end
  end
  
  # DELETE /schools/1
  def destroy
    @school.destroy
  end
  
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_school
    @school = School.find(params[:id])
  end
  
  # Only allow a trusted parameter "white list" through.
  def school_params
    params.require(:school).permit(:name, :cnpj,
    address_attributes: [:id, :street, :neighborhood, :city, :number, :school_id, :_destroy],
    students_attributes: [:id, :name, :cpf, :school_id, :_destroy])
  end
end
