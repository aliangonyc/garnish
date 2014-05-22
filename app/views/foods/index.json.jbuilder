json.array!(@foods) do |food|
  json.extract! food, :id, :item, :description
  json.url food_url(food, format: :json)
end
