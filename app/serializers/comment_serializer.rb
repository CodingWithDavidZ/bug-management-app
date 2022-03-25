class CommentSerializer < ActiveModel::Serializer
  attributes :id, :comment_text, :created_by, :bug_id
end
