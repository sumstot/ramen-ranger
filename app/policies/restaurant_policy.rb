class RestaurantPolicy < ApplicationPolicy
  attr_reader :user, :restaurant

  def show?
    true
  end

  def map?
    true
  end

  def new?
    user.admin?
  end

  def create?
    user.admin?
  end
  
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
    def resolve
      scope.all
    end
  end
end
