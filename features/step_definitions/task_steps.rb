Given /^that project has a task:$/ do |table|
  table.hashes.each do |attributes|
    @project.tasks.create!(attributes)
  end
end
