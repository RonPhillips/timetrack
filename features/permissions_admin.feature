Feature: Assigning permissions
  In order to set up users with the correct permissions
  As an admin
  I want to check all the boxes
  
  Background:
    Given there are the following users:
      | email | password | admin |
      | admin@taskee.com | password | true |
    And I am signed in as them
    And there are the following users:
      | email | password |
      | user@taskee.com | password |
    And there is a project called "TextMate 2"
    And "user@taskee.com" has created a task for this project:
      | title | description |
      | Shiny! | Eye-blindingly so |
    When I follow "Admin"
    And I follow "Users"
    And I follow "user@taskee.com"
    And I follow "Permissions"
  
  Scenario: Viewing a project
    When I check "View" for "TextMate 2"
    And I press "Update"
    And I follow "Sign out"
    Given I am signed in as "user@taskee.com"
    And I am on the projects page
    Then I should see "TextMate 2"
    
  Scenario: Creating tasks for a project
    When I check "View" for "TextMate 2"
    When I check "Create tasks" for "TextMate 2"
    And I press "Update"
    And I follow "Sign out"
    Given I am signed in as "user@taskee.com"
    And I am on the projects page
    When I follow "TextMate 2"
    And I follow "New Task"
    And I fill in "Title" with "Shiny!"
    And I fill in "Description" with "Make it so!"
    And I press "Create"
    Then I should see "Task has been created."
    
  Scenario: Updating a task for a project
    When I check "View" for "TextMate 2"
    And I check "Edit tasks" for "TextMate 2"
    And I press "Update"
    And I follow "Sign out"
    Given I am signed in as "user@taskee.com"
    And I am on the projects page
    When I follow "TextMate 2"
    And I follow "Shiny!"
    And I follow "Edit"
    And I fill in "Title" with "Really shiny!"
    And I press "Update Task"
    Then I should see "Task has been updated"

  Scenario: Deleting a task for a project
    When I check "View" for "TextMate 2"
    And I check "Delete tasks" for "TextMate 2"
    And I press "Update"
    And I follow "Sign out"
    Given I am signed in as "user@taskee.com"
    And I am on the projects page
    When I follow "TextMate 2"
    And I follow "Shiny!"
    And I follow "Delete"
    Then I should see "Task has been deleted."
