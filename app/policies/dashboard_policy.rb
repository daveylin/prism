class DashboardPolicy < ApplicationPolicy
  def index?
    user.present?
  end
  
  def show?
    false
  end
end