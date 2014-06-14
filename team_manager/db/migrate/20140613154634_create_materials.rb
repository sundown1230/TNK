class CreateMaterials < ActiveRecord::Migration
  def change
    create_table :materials do |t|
      t.string :title, default: "title", null:false
      t.text :text, null:true

      t.timestamps
    end
  end
end
