class Report < ActiveRecord::Base
  belongs_to :project
  
  has_many :reports_users;
  has_many :users, through :reports_users

  validates :title, presence: true
  validates :user_id, presence: true
  validates :text, presence: true
end
