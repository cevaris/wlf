json.array!(@accounts) do |account|
  json.extract! account, :id, :user_id, :first_name, :last_name
  json.url account_url(account, format: :json)
end
