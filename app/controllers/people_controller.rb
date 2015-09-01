class PeopleController < ApplicationController
  def new
    @person = Person.new
    authorize current_user
  end

  def create
    @person = Person.new(person_params)
    authorize current_user
    if @person.save
      redirect_to dashboard_index_path, notice: "Person was added successfully."
    else
      flash[:error] = "Error creating person. Please try again."
      render :new
    end
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def index
  end

  def show
  end
  
  private

  def person_params
    params.require(:person).permit(:first_name, :middle_name, :last_name, :dob, :address_line_1, :address_line_2, :city, :state, :zip, :primary_phone, :secondary, :email, :ssn)
  end
end
