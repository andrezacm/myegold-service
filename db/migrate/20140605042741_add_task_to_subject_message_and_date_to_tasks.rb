class AddTaskToSubjectMessageAndDateToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :task, :string
    add_column :tasks, :to, :string
    add_column :tasks, :subject, :string
    add_column :tasks, :message, :string
    add_column :tasks, :date_task, :date
  end
end
