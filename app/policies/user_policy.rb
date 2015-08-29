class UserPolicy < ApplicationPolicy
  def index?
    user.admin?
  end
  
  def new?
    user.admin?
  end
  
  def create?
    user.admin?
  end
  
  def update?
    user.admin?#user.present? && (record.user == current_user || user.admin?)
  end
  
  def edit?
    user.present? && (record.id == user.id || user.admin?)
  end
end