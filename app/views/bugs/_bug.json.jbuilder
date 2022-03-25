json.extract! bug, :id, :issue_title, :issue_description, :identified_by, :identified_date, :project_id, :assigned_to, :status, :status_modified_date, :priority, :target_resolution_date, :progress, :actual_resolution_date, :resolution_summary, :modified_by, :approved, :approved_by, :image_url, :comment_id, :created_by, :created_at, :updated_at
json.url bug_url(bug, format: :json)
