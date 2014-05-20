json.array!(@foods) do |food|
  json.extract! food, :id, :type, :description
  json.url food_url(food, format: :json)
end
