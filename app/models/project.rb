class Project < ApplicationRecord
	has_many :bugs, foreign_key: 'related_project_id'
	belongs_to :team, optional: true
end
