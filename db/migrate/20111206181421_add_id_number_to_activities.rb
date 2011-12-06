class AddIdNumberToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :identifier, :string
    add_index :activities, :identifier
  end
end
