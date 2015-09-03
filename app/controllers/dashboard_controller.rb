class DashboardController < ApplicationController
  def index
    authorize current_user
  end
  
  def show
    authorize current_user
  end
end
