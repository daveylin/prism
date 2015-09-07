class DashboardController < ApplicationController
  def index
    authorize current_user
  end
  
  def show
    authorize current_user
  end
  
  def search
    if params[:dob] == ""
      @people = Person.search(params[:first_name], params[:last_name]).order("first_name ASC")
      render 'index'
    else
      @people = Person.searchdob(params[:first_name], params[:last_name], params[:dob]).order("first_name ASC")
      render 'index'
    end
  end
end
