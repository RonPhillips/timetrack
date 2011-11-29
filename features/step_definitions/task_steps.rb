Given /^"([^\"]*)" has created a task for this project:$/ do |email, table|
  table.hashes.each do |attributes|
    tags = attributes.delete("tags")
    state = attributes.delete("state")
    task = @project.tasks.create!(attributes.merge!(:user => User.find_by_email!(email)))
    task.state = State.find_or_create_by_name(state) if state
    task.tag!(tags) if tags
    task.save
  end
end

When /^I start to create a new task$/ do
  click_on('New Task')
end

When /^I enter the new task information$/ do
  fill_in('Title', :with => 'Default Task Title')
  fill_in('Description', :with =>'Default Task Description')
  click_on('Create Task')
end

When /^I set the task "([^"]*)" to "([^"]*)"$/ do |attr_label, value|
  fill_in(attr_label, :with=>value)
end   

When /^I save the new task$/ do
  click_on('Create Task')
end
   
When /^I navigate to the "([^"]*)" task page$/ do |task_title|
  task = Task.find_by_title!(task_title)
  visit(project_task_path(task.project_id, task.id))
end

When /^I should be on the "([^"]*)" task page$/ do |task_title|
  page.should have_content(task_title)
end
  
When /^I choose to edit the task$/ do
  click_on("Edit Task")
end

When /^I choose to delete the task/ do
  click_on("Delete Task")
end
  
When /^I change the title of the task to "([^"]*)"$/ do |new_name|
  fill_in('Title', :with => new_name)
  click_button('Update Task')
end
    
Then /^I should be shown the task "([^"]*)" verification$/ do |operation|
  page.should have_content("Task has been #{operation}.")
end

Then /^I should see the "([^"]*)" task in the "([^"]*)" ID/ do |task_title, css_id|
  within(css_id) do
    page.should have_content(task_title)
  end
end

Then /^I should not see the "([^"]*)" task title$/ do |task_title|
  page.should have_no_content(task_title)
end

Then /^I should see the new task created by "([^"]*)"$/ do |user_email|
  page.should have_content("Default Task Title")
  page.should have_content("Created by #{user_email}")
end

When /^I create a new task without a name or description$/ do
  click_on('Create Task')
end
    
Then /^I should see the task not "([^"]*)" alert$/ do |operation|
  page.should have_content("Task has not been #{operation}")
end
    
Then /^I should see the task title presence validation alert$/ do
    page.should have_content("Title can't be blank")
end
    
Then /^I should see the task description presence validation alert$/ do
  page.should have_content("Description can't be blank")
end

When /^I create a new task with a description shorter than 10 characters$/ do
  fill_in('Title', :with => 'Default Task Title')
  fill_in('Description', :with =>'2 short')
  click_on('Create Task')
end

Then /^I should see the task description length validation alert$/ do
  page.should have_content("Description is too short")
end

Then /^the "([^"]*)" task is in the "([^"]*)" state$/ do |task_title, state_name|
  task = Task.find_by_title(task_title)
  task.state = State.find_by_name(state_name)
  task.save!
end

