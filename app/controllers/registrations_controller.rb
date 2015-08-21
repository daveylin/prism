class RegistrationsController < Devise::RegistrationsController
 
  def after_sign_up_path_for(resource)
    administration_show_path # Or :prefix_to_your_route
  end
  
  private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :active, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :active, :email, :password, :password_confirmation, :current_password)
  end
  

  
  #def sign_up(resource_name, resource)
    #true
  #end
end