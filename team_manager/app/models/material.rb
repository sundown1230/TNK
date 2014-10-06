class Material < ActiveRecord::Base
	has_many :materials_users
    has_many :users, through: :materials_users
	accepts_nested_attributes_for :materials_users
    validates :title, presence:true
	validates :filename, presence:true
	validates :filetype, presence:true
end
