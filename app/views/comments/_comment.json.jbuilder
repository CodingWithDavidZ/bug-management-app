json.extract! comment, :id, :comment, :ticket_id, :created_by, :created_at, :updated_at
json.url comment_url(comment, format: :json)
