class AddGenerationToUsers < ActiveRecord::Migration
  def change
    change_column :users, :generation, :integer, null:false, default:0
	add_column :users, :description, :string, null:false
  end
end
