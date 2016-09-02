json.array!(@repeaters) do |repeater|
  json.extract! repeater, :id, :entry_id, :frequency, :period
  json.url repeater_url(repeater, format: :json)
end
