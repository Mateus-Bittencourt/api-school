class LecturePolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def update?
    # user == record.user
    true
  end

  def destroy?
    update?
  end

  def show?
    true
  end
end
