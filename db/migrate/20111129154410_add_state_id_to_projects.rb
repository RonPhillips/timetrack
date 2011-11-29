class AddStateIdToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :state_id, :integer
    add_index :projects, :state_id
  end
end
