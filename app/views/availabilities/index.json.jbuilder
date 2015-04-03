json.array!(@availabilities) do |availability|
  json.extract! availability, :id, :name, :start_at
  json.url availability_url(availability, format: :json)
end
