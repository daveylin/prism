class UserPolicy < ApplicationPolicy
  def index?
    user.present?
  end
  
  def show?
    user.present?
  end
  
  def new?
    user.admin?
  end
  
  def create?
    user.admin? || user.genuser?
  end
  
  def update?
    user.admin? || user.genuser?
  end
  
  def edit?
    user.admin? || user.genuser?
  end
end