class Project < ApplicationRecord
	has_many :bugs
	has_many :teams
end
