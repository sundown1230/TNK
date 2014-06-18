class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.integer :project_manager_id
      t.date :starts_at
      t.date :ends_at
      t.text :description
      t.integer :status

      t.timestamps
    end
  end
end
