class AdministrationPolicy < ApplicationPolicy
  
  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end
  def show?
    user.present?
  end
  end
end