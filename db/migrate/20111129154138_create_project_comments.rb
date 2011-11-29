class CreateProjectComments < ActiveRecord::Migration
  def change
    create_table :project_comments do |t|
      t.text :text
      t.references :project
      t.references :user
      t.references :state
      t.integer :previous_state_id

      t.timestamps
    end
    add_index :project_comments, :project_id
    add_index :project_comments, :user_id
    add_index :project_comments, :state_id
  end
end
