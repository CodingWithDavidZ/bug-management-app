json.extract! user, :id, :username, :first_name, :last_name, :role, :team_id, :is_team_lead, :avatar, :password_digest, :created_at, :updated_at
json.url user_url(user, format: :json)
