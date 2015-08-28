class UsersController < ApplicationController
  def new
    @user = User.new
    authorize current_user
  end

  def create
    @user = User.new(user_params)
    authorize current_user
    if @user.save
      redirect_to users_path, notice: "User was saved successfully."
    else
      flash[:error] = "Error creating user. Please try again."
      render :new
    end
  end

  def update
    @user = User.find(params[:id])
    authorize current_user
    if (user_params["password"] == "" && user_params["active"] == "true")
      #binding.pry
      @user.update_attributes(user_params.except(:password, :password_confirmation))
      redirect_to edit_user_path(@user), notice: "User was saved successfully1."
    elsif (user_params["password"] == "" && user_params["active"] == "false")
      #binding.pry
      @user.update_attributes(user_params.except(:password, :password_confirmation))
      redirect_to edit_user_path(@user), notice: "User was saved successfully2."
    elsif @user.update_attributes(user_params.except(:failed_attempts, :locked_at))
      redirect_to edit_user_path(@user), notice: "User was saved successfully3."
    else
      flash[:error] = "Error saving user. Please try again."
      render :edit
    end
  end

  def edit
    @user = User.find(params[:id])
    @user.save
    authorize current_user
  end

  def index
    @users = User.all
    authorize current_user
  end
  
  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :active, :email, :password, :password_confirmation, :role, :failed_attempts, :locked_at)
  end
  
end
