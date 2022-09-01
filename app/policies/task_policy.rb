class TaskPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      user.admin? ? scope.all : scope.where(user: user)
    end
  end

  def completed?
    record.goal.user == user
  end

  def incomplete?
    record.goal.user == user
  end

  def create?
    record.goal.user == user
  end

  def destroy?
    record.goal.user == user
  end
end
