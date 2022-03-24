class CommentSerializer < ActiveModel::Serializer
	attributes :id, :comment, :bug_id, :created_by
end
