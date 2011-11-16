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

