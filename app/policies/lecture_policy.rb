class LecturePolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.where(course: user.courses)
    end
  end

  def create?
    user.kind == 'teacher' && user.courses.include?(record.course)
  end

  def update?
    create?
  end

  def destroy?
    create?
  end

  def show?
    record.user == user || user.courses.include?(record.course)
  end
end
