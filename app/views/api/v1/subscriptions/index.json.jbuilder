json.array! @subscriptions do |subscription|
  json.extract! subscription, :id
  json.extract! subscription.course, :name, :description
end
