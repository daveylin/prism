class PeopleController < ApplicationController
  def new
    @person = Person.new
    authorize current_user
  end

  def create
    @person = Person.new(person_params)
    authorize current_user
    if @person.save
      redirect_to person_path(@person), notice: "Person was added successfully."
    else
      flash[:error] = "Error creating person. Please try again."
      render :new
    end
  end

  def update
    @person = Person.find(params[:id])
      authorize current_user
     if @person.update_attributes(person_params)
       redirect_to person_path, notice: "Person was updated successfully."
     else
       flash[:error] = "Error saving person. Please try again."
       render :edit
     end
  end

  def edit
    @person = Person.find(params[:id])
    @person.save
    authorize current_user
  end

  def destroy
    @person = Person.find(params[:id])
 
    if @person.destroy
      #flash[:notice] = "Person was deleted successfully."
      redirect_to dashboard_index_path, notice: "Person was deleted successfully."
     else
      flash[:error] = "There was an error deleting the person. Please try again."
     end
  end

  def show
    @person = Person.find(params[:id])
  end
  
  private

  def person_params
    params.require(:person).permit(:first_name, :middle_name, :last_name, :dob, :address_line_1, :address_line_2, :city, :state, :zip, :primary_phone, :secondary, :email, :ssn)
  end
end
