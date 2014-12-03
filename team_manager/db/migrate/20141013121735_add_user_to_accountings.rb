class AddUserToAccountings < ActiveRecord::Migration
  def change
    add_belongs_to :accountings, :user, index:true
  end
end
