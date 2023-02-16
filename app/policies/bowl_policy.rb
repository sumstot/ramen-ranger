class BowlPolicy < ApplicationPolicy
  attr_reader :user, :bowl

  def index?
    true
  end

  def show?
    true
  end

  def new?
    create?
  end

  def create?
    user.admin?
  end

  def update?
    user.admin?
  end

  def hall_of_fame?
    true
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
