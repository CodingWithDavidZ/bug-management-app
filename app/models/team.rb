class Team < ApplicationRecord
	belongs_to :project, optional: true
	has_many :users
end
