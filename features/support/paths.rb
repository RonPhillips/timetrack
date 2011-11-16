module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /the home\s?page/
      '/'

    when /the project page for "([^\"]*)"/
      project_path(Project.find_by_name!($1))
      
    when /the activity page for "([^\"]*)"/
      activity_path(Activity.find_by_name!($1))
      
    when /the task page for "([^\"]*)"/
      task = Task.find_by_title!($1)
      project_task_path(task.project, task)
      
    when /the stretch page for "([^\"]*)"/
      stretch_path(Stretch.find_by_note!($1))

    when /the activities page/
      activities_path

    when /the projects page/
      projects_path

    when /the stretches page/
      stretches_path
      

    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      begin
        page_name =~ /the (.*) page/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue Object => e
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)

