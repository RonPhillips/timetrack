Factory.define :task do |task|
  task.title "A factory task"
  task.description "The factory's default task, nothing more"
  task.user { |u| u.association(:user) }
  task.project { |p| p.association(:project) }
end
