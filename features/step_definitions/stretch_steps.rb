Given /^there is a stretch noted "([^"]*)"$/ do |note|
  Factory(:stretch, :note=>note)
end

