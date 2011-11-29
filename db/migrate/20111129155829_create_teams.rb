class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.text :description
      t.references :user

      t.timestamps
    end
    
    create_table :teams_users, :id => false do |t|
      t.integer :team_id, :user_id
    end

    add_index :teams, :user_id
  end
end
