json.extract! project, :id, :project_name, :start_date, :target_end_date, :actual_end_date, :created_by, :modified_by, :created_at, :updated_at
json.url project_url(project, format: :json)
