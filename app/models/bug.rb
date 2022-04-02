class Bug < ApplicationRecord
	has_many :comments, dependent: :destroy
	belongs_to :project, optional: true
	belongs_to :user, foreign_key: :created_by
	belongs_to :user, foreign_key: :assigned_to
	has_many :comments
end
