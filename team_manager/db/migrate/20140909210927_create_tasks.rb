class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.references :project, index: true
	  t.string :title, null:false
	  t.text :content, null:false
	  t.datetime :due, null:false

      t.timestamps
    end
  end
end
