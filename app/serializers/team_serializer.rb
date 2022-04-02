class TeamSerializer < ActiveModel::Serializer
	attributes :id, :team_name, :lead_id, :created_by, :modified_by
end
