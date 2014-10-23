class ChangeTextFromMaterialToContent < ActiveRecord::Migration
  def change
	add_column :materials, :filename, :string, null: false
	add_column :materials, :filetype, :string, null: false
	remove_column :materials, :text, :text
  end
end
