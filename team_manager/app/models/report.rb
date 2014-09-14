class Report < ActiveRecord::Base
  belongs_to :project

  validates :title, presence: true
  validates :user_id, presence: true
  validates :text, presence: true
end
