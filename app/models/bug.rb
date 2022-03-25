class Bug < ApplicationRecord
	has_many :comments, dependent: :destroy
	belongs_to :project, optional: true
	belongs_to :user, optional: true
	has_many :comments
end
