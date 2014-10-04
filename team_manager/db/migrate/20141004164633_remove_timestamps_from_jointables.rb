class RemoveTimestampsFromJointables < ActiveRecord::Migration
  def change
    remove_column :projects_users, :created_at, :datetime
    remove_column :projects_users, :updated_at, :datetime
    remove_column :materials_users, :created_at, :datetime
    remove_column :materials_users, :updated_at, :datetime
  end
end
