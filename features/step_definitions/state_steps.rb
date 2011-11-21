When /^I navigate to the admin\/states page$/ do
  visit(admin_states_path)
end

When /^I start to create a new state$/ do
  click_on('New State')
end

When /^I create a "([^"]*)" state$/ do |jus_saying|
  fill_in('Name', :with => jus_saying)
  click_on('Create State')
end

Then /^I should be shown the state "([^"]*)" verification$/ do |operation|
  responses={'created'=>"State has been created.",
  'not created'=>"State has not been created.",
  'new is default'=>"New is now the default state."
  }
  page.should have_content(responses[operation])
end

When /^I follow "([^"]*)" for the "([^"]*)" state$/ do |link, name|
  state = State.find_by_name!(name)
  steps(%Q{When I follow "#{link}" under "#state_#{state.id}" CSS path})
end


