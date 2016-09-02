json.array!(@payments) do |payment|
  json.extract! payment, :id, :who, :when, :amount, :repeater_id
  json.url payment_url(payment, format: :json)
end
