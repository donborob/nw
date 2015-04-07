json.array!(@conversations) do |conversation|
  json.extract! conversation, :id, :first_id, :second_id
  json.url conversation_url(conversation, format: :json)
end
