Given /^"([^\"]*)" has created a task for this project:$/ do |email, table|
  table.hashes.each do |attributes|
    attributes = attributes.merge!(:user => User.find_by_email!(email))
    @project.tasks.create!(attributes)
  end
end


