json.array! @messages do |message|
  json.id message.id
  json.content message.content
  json.created_at message.created_at
  json.updated_at message.updated_at

end
