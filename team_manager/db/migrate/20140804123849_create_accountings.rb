class CreateAccountings < ActiveRecord::Migration
  def change
    create_table :accountings do |t|
      t.string :title, null:false
      t.string :name, null:false
      t.text :purpose, null:false
      t.datetime :application_date, null:false
      t.integer :status, null:false, default:1
      t.timestamps
    end
  end
end
