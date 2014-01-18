json.array!(@users) do |user|
  json.extract! user, :id, :firstname, :lastname, :pseudo
  json.url user_url(user, format: :json)
end
