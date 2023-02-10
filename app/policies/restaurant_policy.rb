class RestaurantPolicy < ApplicationPolicy
  attr_reader :user, :restaurant

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
    def resolve
      scope.all
    end

    def show?
      true
    end
  end
end
