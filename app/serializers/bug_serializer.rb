class BugSerializer < ActiveModel::Serializer
  attributes :id, :issue_summary, :issue_description, :identified_by, :indentified_date, :related_project_id, :assigned_to, :status, :status_modified_date, :priority, :target_resolution_date, :progress, :actual_resolution_date, :resolution_summary, :modified_by, :approved, :approved_by_id, :image_url, :comment_id
end
