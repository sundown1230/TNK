class CreateMaterialUsers < ActiveRecord::Migration
  def change
    create_table :material_users do |t|
	  t.belongs_to :user, null:false
	  t.belongs_to :material, null:false
      t.timestamps
	end
  end
end
