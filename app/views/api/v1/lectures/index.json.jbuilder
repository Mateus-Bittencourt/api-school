json.array! @lectures do |lecture|
  json.extract! lecture, :id, :title
end
