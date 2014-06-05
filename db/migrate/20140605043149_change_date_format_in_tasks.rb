class ChangeDateFormatInTasks < ActiveRecord::Migration
  def change
		change_column :tasks, :date_task, :datetime
  end
end
