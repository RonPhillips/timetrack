Given /^"([^\"]*)" has created a comment for this task:$/ do |email, table|
  table.hashes.each do |attributes|
    attributes = attributes.merge!(:user => User.find_by_email!(email))
    @task.comments.create!(attributes)
  end
end

When /^I start to create a new comment$/ do
  click_on('New Comment')
end

When /^I create the comment "([^"]*)"$/ do |jus_saying|
  fill_in('Text', :with => jus_saying)
  click_on('Create Comment')
end

Then /^I should be shown the comment "([^"]*)" verification$/ do |operation|
  responses={'created'=>"Comment has been created.",
  'not created'=>"Comment has not been created."
  }
  page.should have_content(responses[operation])
end

Then /^I should see the "([^"]*)" comment in the "([^"]*)" ID/ do |jus_said, css_id|
  within(css_id) do
    page.should have_content(jus_said)
  end
end
    
Then /^I should see the comment text presence validation alert$/ do
    page.should have_content("Text can't be blank")
end

