Given /^there is a tag named "([^"]*)"$/ do |the_name|
  Tag.create!(:name=>the_name)
end

When /^I choose to remove the "([^"]*)" tag$/ do |tag_name|
  click_link("delete-#{tag_name}")
end
