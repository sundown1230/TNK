class ChangeColumns < ActiveRecord::Migration
  def change
    change_column :materials, :title, :string, default:"title"
    change_column :materials, :text, :text, null:true
  end
end
