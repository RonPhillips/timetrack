Given /^there is an activity called "([^"]*)"$/ do |name|
  Factory(:activity, :name=>name)
end

