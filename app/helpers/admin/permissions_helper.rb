module Admin::PermissionsHelper
  def permissions
    {
    "view" => "View",
    "create tasks" => "Create Tasks",
    "edit tasks" => "Edit Tasks",
    "delete tasks" => "Delete Tasks"
    }
  end
end
