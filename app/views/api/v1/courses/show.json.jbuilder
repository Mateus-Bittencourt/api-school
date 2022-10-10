json.extract! @course, :id, :name, :description
json.teacher do
  json.extract! @course.user, :id, :name, :email, :kind
end
json.students @course.users do |student|
  json.extract! student, :id, :name, :email, :kind
end
