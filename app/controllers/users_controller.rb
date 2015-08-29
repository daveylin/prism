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
      @user.locked_at = nil
      @user.failed_attempts = 0
      @user.update_attributes(user_params.except(:password, :password_confirmation))
      redirect_to edit_user_path(@user), notice: "User was saved successfully."
    elsif (user_params["password"] == "" && user_params["active"] == "false")
      @user.locked_at = Time.now
      @user.failed_attempts  = 10
      @user.update_attributes(user_params.except(:password, :password_confirmation))
      redirect_to edit_user_path(@user), notice: "User was saved successfully."
    elsif (user_params["password"] != "" && user_params["active"] == "true")
      @user.locked_at = nil
      @user.failed_attempts  = 0
      @user.update_attributes(user_params)
      redirect_to edit_user_path(@user), notice: "User was saved successfully."
    elsif (user_params["password"] != "" && user_params["active"] == "false")
      @user.locked_at = Time.now
      @user.failed_attempts = 10
      @user.update_attributes(user_params)
      redirect_to edit_user_path(@user), notice: "User was saved successfully."
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
    @users_active = User.where(active: true)
    @users_inactive = User.where(active: false)
    authorize current_user
  end
  
  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :active, :email, :password, :password_confirmation, :role)
  end
  
end
