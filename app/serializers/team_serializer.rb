class TeamSerializer < ActiveModel::Serializer
  attributes :id, :team_name, :lead_id, :project_id, :created_by, :modified_by
end
