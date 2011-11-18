
#    And I follow "States"
#    And I follow "New State"
#    And I fill in "Name" with "Duplicate"
#    And I press "Create State"
#    Then I should see "State has been created."
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
  'not created'=>"State has not been created."
  }
  page.should have_content(responses[operation])
end

