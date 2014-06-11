class ChangeUsersTableDefinition < ActiveRecord::Migration
  def change
    change_column :users, :description, :string, default:"歴代最強"
	change_column :users, :name, :string, default:"TNKマフィア"
  end
end
