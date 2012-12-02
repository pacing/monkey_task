class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.column :today, :date
      t.column :user_id, :integer
      t.timestamps
    end
  end
end
