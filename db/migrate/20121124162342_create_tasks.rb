class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string "name"
      t.datetime "complete"
      t.date "due"
      t.integer "user_id"
      t.timestamps
    end
  end
end
