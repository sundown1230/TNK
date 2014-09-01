class CreateAccountings < ActiveRecord::Migration
  def change
    create_table :accountings do |t|
      t.string :title
      t.string :name
      t.text :purpose
      t.date :date
      t.integer :status
      t.timestamps
    end
  end
end
