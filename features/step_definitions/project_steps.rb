names = {'project'=>'Project Steps Default'}

Given /^there is a project called "([^"]*)"$/ do |name|
  @project=Factory(:project, :name=>name)
end

Given /^I am on the projects page$/ do
  visit(projects_path)
end

When /^I navigate to the new project creation page$/ do
  click_link('New Project')
end

When /^I create a new project$/ do
  fill_in('Name', :with => names['project'])
  click_button('Create Project')
end

When /^I create a new project without a name$/ do
  fill_in('Name', :with => '')
  click_button('Create Project')
end

Then /^I should see the project creation denied alert$/ do
  page.should have_content("Project has not been created.")
end

Then /^I should see the project name presence validation alert$/ do
  page.should have_content("Name can't be blank")
end

Then /^I should be shown the project created verification$/ do
  page.should have_content("Project has been created.")
end

When /^I change the name of the project to "([^"]*)"$/ do |new_name|
  fill_in('Name', :with => new_name)
  click_button('Update Project')
end

Then /^I should be shown the project updated verification$/ do
  page.should have_content("Project has been updated.")
end

Then /^I should see the project update denied alert$/ do
  page.should have_content("Project has not been updated.")
end

When /^I delete the project$/ do
  click_on('Delete Project')
end

Then /^I should see the project deleted alert$/ do
  page.should have_content("Project has been deleted.")
end

Then /^I should be on the project page for the new project$/ do
  current_path.should == project_path(Project.find_by_name!(names['project']))
  page.should have_content("#{names['project']} - Projects - Timetracker")
end

Then /^I should not see the "([^"]*)" project$/ do |project_name|
  page.should have_no_content(project_name)
end

When /^I navigate to the "([^"]*)" project page$/ do |project_name|
  visit(project_path(Project.find_by_name!(project_name)))
end

When /^I navigate to the "([^"]*)" project edit page$/ do |project_name|
  visit(edit_project_path(Project.find_by_name!(project_name)))
end


Then /^I should be on the project page for "([^"]*)"$/ do |project_name|
  current_path.should == project_path(Project.find_by_name!(project_name))
  page.should have_content("#{project_name} - Projects - Timetracker")
end

