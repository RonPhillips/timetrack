permission_step = /^"([^"]*)" can ([^"]*?) ([o|i]n)?\s?the "([^"]*)" project$/

Given permission_step do |user, permission, on, project|
  create_permission(user, find_project(project), permission)
end

When /^I check "([^"]*)" for "([^"]*)"$/ do |permission, name|
  project = Project.find_by_name!(name)
  permission = permission.downcase.gsub(" ", "_")
  field_id = "permissions_#{project.id}_#{permission}"
  steps(%Q{When I check "#{field_id}"})
end

When /^I grant "([^"]*)" permission on "([^"]*)"$/ do |permission, name|
  project = Project.find_by_name!(name)
  permission = permission.downcase.gsub(" ", "_")
  field_id = "permissions_#{project.id}_#{permission}"
  check(field_id)
  #steps(%Q{When I check "#{field_id}"})
end
When /^I commit my permissions changes$/ do
  click_on("Update")
end

When /^I choose to edit permissions$/ do
  click_on("Permissions")
end

def create_permission(email, object, action)
  Permission.create!(:user => User.find_by_email!(email),
  :permissions_apply => object,
  :action => action)
end

def find_project(name)
  Project.find_by_name!(name)
end
