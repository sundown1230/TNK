class Material < ActiveRecord::Base
	has_many :material_users
    has_many :users, through: :material_users
	accepts_nested_attributes_for :users
    validates :title, presence:true
	validates :text, presence:true
end
