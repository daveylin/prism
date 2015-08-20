class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :active, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :active, :email, :password, :password_confirmation, :current_password)
  end
  
  def after_sign_up_path_for(resource)
    '/users/sign_up' # Or :prefix_to_your_route
  end
end