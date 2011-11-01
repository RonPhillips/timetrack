class CreateStretches < ActiveRecord::Migration
  def change
    create_table :stretches do |t|
      t.datetime :recorded_on
      t.integer :starting_quarter
      t.string :note
      t.float :duration
      t.integer :activity_id

      t.timestamps
    end
  end
end
