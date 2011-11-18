# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)
admin_user = User.create(:email => "admin@timetrack.com",:password => "password")
admin_user.admin = true
admin_user.save
#admin_user.confirm!

Project.create(:name => "Timetrack Seed Project")

State.create(:name => "Open",
:background => "#00CFFD",
:color => "white")
State.create(:name => "Closed",
:background => "black",
:color => "white")
State.create(:name => "New",
:background => "#85FF00",
:color => "white",
:default => true)
