class CreateLogEntriesTags < ActiveRecord::Migration
  def change
    create_table :log_entries_tags, :id => false do |t|
      t.integer :log_entry_id, :tag_id
    end

  end
end
