class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :text
      t.integer :task_id
      t.integer :user_id

      t.timestamps
    end
  end
end
