json.array!(@comments) do |comment|
  json.extract! comment, :id, :user_name, :content
  json.url comment_url(comment, format: :json)
end
