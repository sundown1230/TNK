class CreateMaterialCategories < ActiveRecord::Migration
  def change
    create_table :material_categories do |t|
      t.string :category_name, null:false
    end
  end
end
