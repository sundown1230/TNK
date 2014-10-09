class Accounting < ActiveRecord::Base
  validates :title, presence: true
  validates :name, presence: true
  validates :purpose, presence: true
  validates :application_date, presence: true  
  validates :status, presence:true
  has_many :images, as: :imageable, autosave: true, dependent: :destroy
  accepts_nested_attributes_for :images
end
