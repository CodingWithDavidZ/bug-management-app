class User < ApplicationRecord
	has_secure_password
	has_many :bugs
	belongs_to :team, optional: true
	has_many :comments, foreign_key: :created_by
	# def assign_team_leader
	#     if User.is_team_lead == true
	#         #TODO verify no lead_id exists
	#         #move to team model
	#         #better to be done during creation of team
	#         Team.lead_id.update(self.id)
	#     else
	#         return false
	#     end
	# end
end
