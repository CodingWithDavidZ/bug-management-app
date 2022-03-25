class Bug < ApplicationRecord
	has_many :comments, dependent: :destroy
	belongs_to :project
	belongs_to :user
	has_many :comments
end
