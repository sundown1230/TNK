class CreateMaterialUsers < ActiveRecord::Migration
  def change
    create_table :material_users, id: false do |t|
	  t.belongs_to :material, null:false
	  t.belongs_to :user, null:false
    end
  end
end
