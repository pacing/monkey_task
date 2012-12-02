class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.column :schedule_id, :integer
      t.column :task_id, :integer
      t.column :position, :integer
      t.timestamps
    end
  end
end
