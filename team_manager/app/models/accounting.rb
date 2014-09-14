class Accounting < ActiveRecord::Base
  validates :title, presence: true
  validates :name, presence: true
  validates :purpose, presence: true
  validates :application_date, presence: true  
end
