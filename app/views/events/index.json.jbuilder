json.array!(@events) do |event|
  json.extract! event, :id, :name, :description, :start_date, :end_time
  json.url event_url(event, format: :json)
end
