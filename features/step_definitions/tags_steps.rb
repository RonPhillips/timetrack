When /^I choose to remove the "([^"]*)" tag$/ do |tag_name|
  click_link("delete-#{tag_name}")
end
