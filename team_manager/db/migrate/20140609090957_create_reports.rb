class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.integer :user_id, null:false
      t.text :text, null:false
      t.string :title, null:false
      t.references :project, index: true

      t.timestamps
    end
  end
end
