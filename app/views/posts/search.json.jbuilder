json.array! @result do |r|
  json.name     r["name"]
  json.address  r["location"]["display_address"]
end