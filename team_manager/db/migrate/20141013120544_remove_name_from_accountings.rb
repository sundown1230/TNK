class RemoveNameFromAccountings < ActiveRecord::Migration
  def change
    remove_column :accountings, :name, :string
  end
end
