class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :title
      t.attachment :image_file
      t.references :imageable, polymorphic: true
      t.timestamps
    end
  end
end
