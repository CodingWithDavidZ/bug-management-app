json.extract! comment, :id, :comment_text, :created_by, :bug_id, :created_at, :updated_at
json.url comment_url(comment, format: :json)
