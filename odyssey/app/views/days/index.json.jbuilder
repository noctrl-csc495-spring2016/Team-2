json.array!(@days) do |day|
  json.extract! day, :id, :date, :number_of_pickups
  json.url day_url(day, format: :json)
end
