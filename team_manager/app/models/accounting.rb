class Accounting < ActiveRecord::Base
  validates :title, presence: true
  validates :name, presence: true
  validates :purpose, presence: true
  validates :date, presence: true  
end
