class DashboardController < ApplicationController
  def index
    #@people = Person.all
  if params[:search]
    @people = Person.search(params[:search]).order("first_name ASC")
    redirect_to dashboard_index_path
  else
    #@people = Person.all.order("first_name ASC")
  end
    authorize current_user
  end
  
  def show
    authorize current_user
  end
end
