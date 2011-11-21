Given /^"([^\"]*)" has created a comment for this task:$/ do |email, table|
  table.hashes.each do |attributes|
    attributes = attributes.merge!(:user => User.find_by_email!(email))
    @task.comments.create!(attributes)
  end
end

Given /^there is a state called "([^"]*)"$/ do |name|
  State.create!(:name => name)
end

When /^I start to create a new comment$/ do
  click_on('New Comment')
end

When /^I comment "([^"]*)"$/ do |jus_saying|
  fill_in('Text', :with => jus_saying)
end

When /^I set the state to "([^"]*)"$/ do |state|
  select(state, :from => 'State')
end

When /^I save the comment/ do 
  click_on('Create Comment')
end

Then /^I should be shown the comment "([^"]*)" verification$/ do |operation|
  responses={'created'=>"Comment has been created.",
  'not created'=>"Comment has not been created."
  }
  page.should have_content(responses[operation])
end
    
Then /^I should see the comment text presence validation alert$/ do
    page.should have_content("Text can't be blank")
end


