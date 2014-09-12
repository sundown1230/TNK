class CreateAccountings < ActiveRecord::Migration
  def change
    create_table :accountings do |t|
      t.string :title, null:false
      t.string :name, null:false
      t.text :purpose, null:false
      t.date :date, null:false
      t.integer :status, null:false
      t.timestamps
    end
  end
end
