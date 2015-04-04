json.array!(@availability) do |available|
  json.extract! available, :id, :name, :start_time
  json.url bridalshower_index_path(available, format: :json)
end