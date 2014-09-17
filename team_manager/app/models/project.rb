class Project < ActiveRecord::Base
    has_many :reports, dependent: :destroy
	has_many :tasks, dependent: :destroy

	has_many :projects_users
	has_many :users, through: :projects_users
	accepts_nested_attributes_for :projects_users

    validates :title, presence: true
	validates :description, presence: true
	#validates :project_manager_id, presence: true

end
