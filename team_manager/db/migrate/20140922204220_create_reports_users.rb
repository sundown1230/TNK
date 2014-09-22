class CreateReportsUsers < ActiveRecord::Migration
  def change
    create_table :reports_users do |t|
	  t.belongs_to :user, null: false
	  t.belongs_to :report, null: false
    end
  end
end
