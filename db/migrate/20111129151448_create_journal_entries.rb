class CreateJournalEntries < ActiveRecord::Migration
  def change
    create_table :journal_entries do |t|
      t.datetime :recorded_on
      t.integer :starting_quarter
      t.string :note
      t.float :duration
      t.references :activity
      t.references :task
      t.string :rfs

      t.timestamps
    end
    add_index :journal_entries, :activity_id
    add_index :journal_entries, :task_id
  end
end
