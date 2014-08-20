class CreateEvent2s < ActiveRecord::Migration
  def change
    create_table :event2s do |t|
      t.string :name
      t.string :owner
      t.string :date
      t.string :locate
      t.string :address

      t.timestamps
    end
  end
end
