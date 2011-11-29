require 'uri'
require 'cgi'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))


Given /^I have run the seed task$/ do
  load Rails.root + "db/seeds.rb"
end

Then /^"([^"]*)"(?: should appear in the "([^"]*)" section)?$/ do |text,section|
  with_scope(section,:css_id) do
    page.should have_content(text)
  end
end

Given /^I am on the homepage$/ do
  visit('/')
end

Given /^I navigate to the admin subsite$/ do
  click_on("Admin")
end

Then /^I should see a name presence validation alert$/ do
  page.should have_content("Name can't be blank")
end

Then /^show me the page$/ do
  save_and_open_page
end

Then /^I should see "([^"]*)" under the "([^"]*)" CSS path/ do |content, css_id|
  within(css_id) do
    page.should have_content(content)
  end
end

Then /^I should not see "([^"]*)" under the "([^"]*)" CSS path/ do |content, css_id|
  within(css_id) do
    page.should have_no_content(content)
  end
end

When /^I follow "([^"]*)" under "([^"]*)" CSS path$/ do |link_text, css_id|
  within(css_id) do
    click_on(link_text)
  end
end

Then /^I should not see the "([^"]*)" element$/ do |css|
  page.should_not(have_css(css),
        "Expected to not see the #{css} element, but did.")
end
#Given /^(?:|I )am on (.+)$/ do |page_name|
#  visit path_to(page_name)
#end

#When /^(?:|I )go to (.+)$/ do |page_name|
#  visit path_to(page_name)
#end

#Then /^(?:|I )should be on (.+)$/ do |page_name|
#  current_path = URI.parse(current_url).path
#  if current_path.respond_to? :should
#    current_path.should == path_to(page_name)
#  else
#    assert_equal path_to(page_name), current_path
#  end
#end

