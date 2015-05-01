json.array!(@event_submissions) do |event_submission|
  json.extract! event_submission, :id, :account_id, :event_id
  json.url event_submission_url(event_submission, format: :json)
end
