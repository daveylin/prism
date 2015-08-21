class AdministrationPolicy < ApplicationPolicy
 
  def show?
    user.present?
  end

end