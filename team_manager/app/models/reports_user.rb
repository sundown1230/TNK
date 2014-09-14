class ReportsUser < ActiveRecord::Base
  belongs_to :report
  belongs_to :user
end
