class CoursePolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def update?
    # true
    record.user == user
  end

  def create?
    user.kind == 'teacher'
  end

  def destroy?
    update?
  end
end
