Given /^there are the following users:$/ do |table|
  table.hashes.each do |attributes|
    @user = User.create!(attributes)
    @user.update_attribute("admin", attributes["admin"] == "true")
  end
end

Given /^I navigate to the sign in page$/ do
  visit(new_user_session_path)
end

Given /^I sign out$/ do
  click_on("Sign out")
end
#Given /^I sign in$/ do
#  fill_in('Email', :with => "#{@user.email}")
#  fill_in('Password', :with => 'password')
#  click_on('Sign in')
#end

Then /^I should be shown the sign in success verification$/ do
  page.should have_content("Signed in successfully.")
end

Given /^I navigate to the user sign up page$/ do
  click_link("Sign up")
end

Given /^I sign up as a new user$/ do
  fill_in('Email', :with => "default_user@somesite.org")
  fill_in('Password', :with => 'password')
  fill_in('Password confirmation', :with=>'password')
  click_button('Sign up')
end

Then /^I should be shown the user sign up success verification$/ do
  page.should have_content("You have signed up successfully.")
end

#Given /^I am signed in as them$/ do
#  steps(%Q{
#  When I navigate to the sign in page
#  And I sign in
#  Then I should be shown the "sign in success" verification
#  })
#end

Given /^I sign in as "([^\"]*)"$/ do |email|
  user = User.find_by_email!(email)
  visit(new_user_session_path)
  fill_in('Email', :with => "#{user.email}")
  fill_in('Password', :with => 'password')
  click_button('Sign in')
end

Then /^I navigate to the admin\/users page$/ do
  click_on("Users")
end

Then /^I choose to create a user$/ do
  click_on("New User")
end

Then /^I create a user$/ do
  fill_in("Email", :with =>"newbie@ticketee.com")
  fill_in("Password", :with =>"password")
  click_on("Create User")
end

Then /^I create a user with a blank email$/ do
  fill_in("Email", :with =>"")
  fill_in("Password", :with =>"password")
  click_on("Create User")
end

Then /^I create an admin user$/ do
  fill_in("Email", :with =>"newadmin@ticketee.com")
  fill_in("Password", :with =>"password")
  check("Is an admin?")
  click_on("Create User")
end

Then /^I should see the new user$/ do
  page.should have_content("newbie@ticketee.com")
end

Then /^I should see the new user labeled as admin$/ do
  page.should have_content("newadmin@ticketee.com (Admin)")
end
Then /^I should see user "([^\"]*)"$/ do |user_email|
  page.should have_content(user_email)
end
Then /^I should not see user "([^\"]*)"$/ do |user_email|
  page.should have_no_content(user_email)
end

Then /^I navigate to the "([^\"]*)" user page$/ do |user_email|
  visit(admin_user_path(User.find_by_email(user_email)))
end

Then /^I choose to edit the user$/ do
  click_on("Edit User")
end
    
When /^I change the email of the user to "([^\"]*)"$/ do |updated_email|
  fill_in("Email", :with =>updated_email)
  click_on("Update User")
end

When /^I change the user to an admin user$/ do
  check("Is an admin?")
  click_on("Update User")
end
    
Then /^I choose to delete the user$/ do
  click_on("Delete User")
end

When /^I should see "([^\"]*)" labeled as an admin user$/ do |email|
  page.should have_content("#{email} (Admin)")
end

Then /^I should be shown the "([^\"]*)" verification$/ do |process|
  options={
        "user created"=>"User has been created.",
        "user not created"=>"User has not been created.",
        "user updated"=>"User has been updated.",
        "user not updated" => "User has not been updated.",
        "user deleted" => "User has been deleted",
        "user not deleted" => "User has not been deleted"}
  page.should have_content(options[process])
end

Then /^I should see the "([^\"]*)" validation alert$/ do |validating|
  options={"user title presence"=>"Email can't be blank",
        "user email valid"=>"Email is invalid", 
        "user cannot delete self" => "You cannot delete yourself!"}
  page.should have_content(options[validating])
end

