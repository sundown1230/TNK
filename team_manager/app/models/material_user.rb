class MaterialUser < ActiveRecord::Base
  belongs_to :material
  belongs_to :user
end
