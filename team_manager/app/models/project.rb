class Project < ActiveRecord::Base
    has_many :reports
    validates :title, presence: true
	validates :description, presence: true
	#validates :project_manager_id, presence: true

end
