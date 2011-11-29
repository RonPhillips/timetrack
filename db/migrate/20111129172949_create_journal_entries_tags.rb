class CreateJournalEntriesTags < ActiveRecord::Migration
  def change
    create_table :journal_entries_tags, :id => false do |t|
      t.integer :journal_entry_id, :tag_id
    end

  end
end
