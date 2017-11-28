json.array!(@entries) do |entry|
  json.extract! entry, :id, :name, :amount, :day, :note
  json.url entry_url(entry, format: :json)
end
