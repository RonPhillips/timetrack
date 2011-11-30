Given /^"([^\"]*)" has created a comment for this project:$/ do |email, table|
  table.hashes.each do |attributes|
    attributes = attributes.merge!(:user => User.find_by_email!(email))
    @project.project_comments.create!(attributes)
  end
end





