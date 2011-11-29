class AddDeadlineAtToTasksProjects < ActiveRecord::Migration
  def change
    add_column :projects, :deadline_at, :datetime
    add_column :tasks, :deadline_at, :datetime
  end
end
