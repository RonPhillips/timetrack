class CreateStates < ActiveRecord::Migration
  def up
    create_table :states do |t|
      t.string :name
      t.string :color
      t.string :background
    end
    add_column :tasks, :state_id, :integer
    add_index :tasks, :state_id
    add_column :comments, :state_id, :integer
  end
  
  def down
    drop_table :states
    remove_column :tasks, :state_id
    remove_column :comments, :state_id
  end
end
