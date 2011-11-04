class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
      t.integer :user_id
      t.integer :permissions_apply_id
      t.string :permissions_apply_type
      t.string :action

      t.timestamps
    end
  end
end
