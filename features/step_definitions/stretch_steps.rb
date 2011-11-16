Given /^there is a stretch noted "([^"]*)"$/ do |note|
  Factory(:stretch, :note=>note)
end

When /^I am on the stretches page$/ do
  visit(stretches_path)
end

When /^I choose to create a new stretch$/ do
  click_on("New Stretch")
end

When /^I enter a new stretch$/ do
  fill_in "Recorded on", :with => "12/04/11"
  fill_in "Duration", :with => "5.25"
  fill_in "Starting quarter", :with => "32"
  fill_in "Note", :with => "Test stretch creation"
  click_on("Create Stretch")
end

When /^I should be shown the stretch "([^"]*)" verification$/ do |process|
  ver_map={"created"=>"Stretch has been created.", 
        "not created"=>"Stretch has not been created.",
        "updated"=>"Stretch has been updated.",
        "not updated"=>"Stretch has not been updated.",
        "deleted"=>"Stretch has been deleted.",
        "not deleted"=>"Stretch has been deleted."}
  page.should have_content(ver_map[process])
end

When /^I should be on the stretch page for the new stretch$/ do
  page.should have_content("Test stretch creation")
  page.should have_content("Test stretch creation - Stretches - Timetracker")
end

When /^I navigate to the stretch page with note "([^"]*)"$/ do |note_content|
  visit(stretch_path(Stretch.find_by_note(note_content)))
end

When /^I choose to edit the stretch$/ do
  click_on("Edit Stretch")
end

When /^I enter a new stretch with no duration$/ do
  fill_in "Recorded on", :with => "12/04/11"
  fill_in "Duration", :with => ""
  fill_in "Starting quarter", :with => "32"
  fill_in "Note", :with => "Test stretch creation"
  click_on("Create Stretch")
end

When /^I change the stretch duration to ""$/ do
  fill_in "Duration", :with => ""
  click_on("Update Stretch")
end


When /^I should see the stretch "([^"]*)" validation alert$/ do |alert|
  alerts={"duration cannot be blank"=>"Duration can't be blank",
  }
  page.should have_content(alerts[alert])
end

When /^I change the stretch note to "([^"]*)"$/ do |note_content|
  fill_in "Note", :with => note_content
  click_on("Update Stretch")
end

When /^I should be on the stretch page with note "([^"]*)"$/ do |note_content|
  page.should have_content(note_content)
end
When /^I should not see the stretch with note "([^"]*)"$/ do |note_content|
  page.should have_no_content(note_content)
end

When /^I delete the stretch$/ do
  click_on("Delete Stretch")
end


