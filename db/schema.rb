# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111205153148) do

  create_table "activities", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", :force => true do |t|
    t.text     "text"
    t.integer  "task_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "state_id"
    t.integer  "previous_state_id"
  end

  create_table "journal_entries", :force => true do |t|
    t.datetime "recorded_on"
    t.integer  "starting_quarter"
    t.string   "note"
    t.float    "duration"
    t.integer  "activity_id"
    t.integer  "task_id"
    t.string   "rfs"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "journal_entries", ["activity_id"], :name => "index_journal_entries_on_activity_id"
  add_index "journal_entries", ["task_id"], :name => "index_journal_entries_on_task_id"
  add_index "journal_entries", ["user_id"], :name => "index_journal_entries_on_user_id"

  create_table "journal_entries_tags", :id => false, :force => true do |t|
    t.integer "journal_entry_id"
    t.integer "tag_id"
  end

  create_table "log_entries_tags", :id => false, :force => true do |t|
    t.integer "log_entry_id"
    t.integer "tag_id"
  end

  create_table "permissions", :force => true do |t|
    t.integer  "user_id"
    t.integer  "permissions_apply_id"
    t.string   "permissions_apply_type"
    t.string   "action"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "project_comments", :force => true do |t|
    t.text     "text"
    t.integer  "project_id"
    t.integer  "user_id"
    t.integer  "state_id"
    t.integer  "previous_state_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "project_comments", ["project_id"], :name => "index_project_comments_on_project_id"
  add_index "project_comments", ["state_id"], :name => "index_project_comments_on_state_id"
  add_index "project_comments", ["user_id"], :name => "index_project_comments_on_user_id"

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "state_id"
    t.datetime "deadline_at"
  end

  add_index "projects", ["state_id"], :name => "index_projects_on_state_id"

  create_table "states", :force => true do |t|
    t.string  "name"
    t.string  "color"
    t.string  "background"
    t.boolean "default",    :default => false
  end

  create_table "stretches", :force => true do |t|
    t.datetime "recorded_on"
    t.integer  "starting_quarter"
    t.string   "note"
    t.float    "duration"
    t.integer  "activity_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "tags_tasks", :id => false, :force => true do |t|
    t.integer "tag_id"
    t.integer "task_id"
  end

  create_table "tasks", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "state_id"
    t.datetime "deadline_at"
  end

  add_index "tasks", ["project_id"], :name => "index_tasks_on_project_id"
  add_index "tasks", ["state_id"], :name => "index_tasks_on_state_id"

  create_table "teams", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "teams", ["user_id"], :name => "index_teams_on_user_id"

  create_table "teams_users", :id => false, :force => true do |t|
    t.integer "team_id"
    t.integer "user_id"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "",    :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",                                 :default => false
    t.string   "given_name"
    t.string   "family_name"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
