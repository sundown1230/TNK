class ChangeNullYesToNo < ActiveRecord::Migration
  def change
    change_column :projects, :title, :string, null: false
	change_column :projects, :description, :text, null: false
	change_column :projects, :updated_at, :datetime, null: false
	change_column :projects, :created_at, :datetime, null: false
  end
end
