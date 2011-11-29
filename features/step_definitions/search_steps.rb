When /^I enter the task search "([^"]*)"$/ do |value|
  fill_in("Title contains", :with=>value)
end   

When /^I send the search request$/ do
  click_on('Search')
end

When /^I enter the tag search "([^"]*)"$/ do |value|
  fill_in("Tag Name contains", :with=>value)
end   

