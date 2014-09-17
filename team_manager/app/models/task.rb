class Task < ActiveRecord::Base
  belongs_to :project
  
  has_many :tasks_users
  has_many :usersi, through: :tasks_users
  accepts_nested_attributes_for :tasks_users

  validates :title, presence: true
  validates :due, presence: true
  validates :content, presence: true
end
