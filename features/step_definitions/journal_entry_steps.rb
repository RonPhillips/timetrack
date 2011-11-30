Given /^"([^\"]*)" has created a journal entry:$/ do |email, table|
  table.hashes.each do |attributes|
    tags = attributes.delete("tags")
    journal_entry = JournalEntry.create!(attributes.merge!(:user => User.find_by_email!(email)))
    journal_entry.tag!(tags) if tags
    journal_entry.save
  end
end

Given /^there is a journal entry noted "([^"]*)"$/ do |note|
  Factory(:journal_entry, :note=>note)
end

When /^I am on the journal entries page$/ do
  visit(journal_entries_path)
end

When /^I choose to create a new journal entry$/ do
  click_on("New Journal Entry")
end

#When /^I enter a new journal entry$/ do
#  fill_in "Recorded on", :with => "12/04/11"
#  fill_in "Duration", :with => "5.25"
#  fill_in "Starting quarter", :with => "32"
#  fill_in "Note", :with => "Test Journal Entry creation"
#  click_on("Create Journal entry")
#end

When /^I save the new journal entry$/ do
  click_on("Create Journal entry")
end

When /^I should be shown the journal entry "([^"]*)" verification$/ do |process|
  ver_map={"created"=>"Journal Entry has been created.", 
        "not created"=>"Journal Entry has not been created.",
        "updated"=>"Journal Entry has been updated.",
        "not updated"=>"Journal Entry has not been updated.",
        "deleted"=>"Journal Entry has been deleted.",
        "not deleted"=>"Journal Entry has been deleted."}
  page.should have_content(ver_map[process])
end

When /^I should be on the journal entry page for the new journal entry$/ do
  page.should have_content("Test Journal Entry creation")
  page.should have_content("Test Journal Entry creation - Journal Entries - Timetracker")
end

When /^I navigate to the journal entry page with note "([^"]*)"$/ do |note_content|
  visit(journal_entry_path(JournalEntry.find_by_note(note_content)))
end

When /^I choose to edit the journal entry$/ do
  click_on("Edit Journal Entry")
end

#When /^I enter a new journal entry with no duration$/ do
#  fill_in "Recorded on", :with => "12/04/11"
#  fill_in "Duration", :with => ""
#  fill_in "Starting quarter", :with => "32"
#  fill_in "Note", :with => "Test Journal Entry creation"
#  click_on("Create Journal entry")
#end

When /^I change the journal entry duration to ""$/ do
  fill_in "Duration", :with => ""
  click_on("Update Journal entry")
end

When /^I save the journal entry changes$/ do
  click_on("Update Journal entry")
end


When /^I should see the journal entry "([^"]*)" validation alert$/ do |alert|
  alerts={"duration cannot be blank"=>"Duration can't be blank",
  }
  page.should have_content(alerts[alert])
end

When /^I set the journal entry "([^"]*)" to "([^"]*)"$/ do |attr_label, value|
  fill_in(attr_label, :with=>value)
end   

When /^I change the journal entry note to "([^"]*)"$/ do |note_content|
  fill_in "Note", :with => note_content
  click_on("Update Journal entry")
end

When /^I should be on the journal entry page with note "([^"]*)"$/ do |note_content|
  page.should have_content(note_content)
end
When /^I should not see the journal entry with note "([^"]*)"$/ do |note_content|
  page.should have_no_content(note_content)
end

When /^I delete the journal entry$/ do
  click_on("Delete Journal Entry")
end


