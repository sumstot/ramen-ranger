class BowlPolicy < ApplicationPolicy
  attr_reader :user, :bowl

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
    def resolve
      scope.all
    end
  end

  def initialize(user)
    @user = user
  end

  def create?
    user.admin?
  end

  def update?
    user.admin? || !bowl.published?
  end

  def destroy?
    user.admin?
  end
end
