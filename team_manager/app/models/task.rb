class Task < ActiveRecord::Base
  belongs_to :project
  validates :title, presence: true
  validates :due, presence: true
  validates :content, presence: true
end
