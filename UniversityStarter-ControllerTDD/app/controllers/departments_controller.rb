class DepartmentsController < ApplicationController

    # GET /departments
    def index
      @active_departments = Department.all
    end
  
    # GET /departments/1
    def show
      @department = Department.find(params[:id])
    end
  
    # GET /departments/new
    def new
      @department = Department.new
    end
  
    # GET /departments/1/edit
    def edit
      @department = Department.find(params[:id])
    end
  
  end
  