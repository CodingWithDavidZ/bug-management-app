json.extract! bug, :id, :issue_summary, :issue_description, :identified_by, :indentified_date, :related_project_id, :assigned_tostatus, :priority, :target_resolution_date, :progress, :actual_resolution_date, :resolution_summary, :created_by, :modified_by, :approved, :image_url, :comment_id, :created_at, :updated_at
json.url bug_url(bug, format: :json)
