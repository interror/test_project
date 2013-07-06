class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :task_name
      t.text :task
      t.string :status
      t.datetime :dead_line
      t.integer :priority

      t.timestamps
    end
  end
end
