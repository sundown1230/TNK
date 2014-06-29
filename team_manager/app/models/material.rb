class Material < ActiveRecord::Base
    has_many :users, through: :materials_users
    validates :title, presence:true
	validates :text, presence:true
end
