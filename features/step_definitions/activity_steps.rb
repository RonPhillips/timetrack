names={'activity'=>'Default Activity Name'}
Given /^there is an activity called "([^"]*)"$/ do |name|
  Factory(:activity, :name=>name)
end

Given /^I am on the activities page$/ do
  visit(activities_path)
end

When /^I navigate to the new activity creation page$/ do
  click_link('New Activity')
end

When /^I create a new activity$/ do
  fill_in('Name', :with => names['activity'])
  click_button('Create Activity')
end

When /^I create a new activity without a name$/ do
  fill_in('Name', :with => '')
  click_button('Create Activity')
end

Then /^I should see the activity creation denied alert$/ do
  page.should have_content("Activity has not been created.")
end

Then /^I should see the activity name presence validation alert$/ do
  page.should have_content("Name can't be blank")
end

Then /^I should be shown the activity created verification$/ do
  page.should have_content("Activity has been created.")
end

When /^I change the name of the activity to "([^"]*)"$/ do |new_name|
  fill_in('Name', :with => new_name)
  click_button('Update Activity')
end

Then /^I should be shown the activity updated verification$/ do
  page.should have_content("Activity has been updated.")
end

Then /^I should see the activity update denied alert$/ do
  page.should have_content("Activity has not been updated.")
end

When /^I delete the activity$/ do
  click_on('Delete Activity')
end

Then /^I should see the activity deleted alert$/ do
  page.should have_content("Activity has been deleted.")
end

Then /^I should be on the activity page for the new activity$/ do
  current_path.should == activity_path(Activity.find_by_name!(names['activity']))
  page.should have_content("#{names['activity']} - Activities - Timetracker")
end

Then /^I should not see the "([^"]*)" activity$/ do |activity_name|
  page.should have_no_content(activity_name)
end

When /^I navigate to the "([^"]*)" activity page$/ do |activity_name|
  visit(activity_path(Activity.find_by_name!(activity_name)))
end

When /^I navigate to the "([^"]*)" activity edit page$/ do |activity_name|
  visit(edit_activity_path(Activity.find_by_name!(activity_name)))
end


Then /^I should be on the activity page for "([^"]*)"$/ do |activity_name|
  current_path.should == activity_path(Activity.find_by_name!(activity_name))
  page.should have_content("#{activity_name} - Activities - Timetracker")
end

