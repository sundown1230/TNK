class Project < ActiveRecord::Base
    validates :title, presence: true
	validates :description, presence: true
	#validates :project_manager_id, presence: true

end
