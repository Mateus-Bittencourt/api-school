class SubscriptionPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.where(user:)
    end
  end

  def create?
    user.kind == 'student'
  end

  def destroy?
    record.user == user || record.course.user == user
  end
end
