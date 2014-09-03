class Project < ActiveRecord::Base
    has_many :reports, dependent: :destroy
	has_many :tasks, dependent: :destroy
    validates :title, presence: true
	validates :description, presence: true
	#validates :project_manager_id, presence: true

end
