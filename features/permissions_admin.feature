Feature: Assigning permissions
  In order to set up users with the correct permissions
  As an admin
  I want to check all the boxes
  
  Background:
    Given there are the following users:
      | email | password | admin |
      | admin@taskee.com | password | true |
    And I sign in as "admin@taskee.com"
    And there are the following users:
      | email | password |
      | user@taskee.com | password |
    And there is a project called "TextMate 2"
    And "user@taskee.com" has created a task for this project:
      | title | description |
      | Shiny! | Eye-blindingly so |
    When I navigate to the admin subsite
    And I navigate to the "user@taskee.com" user page
    And I choose to edit permissions

  Scenario: Viewing a project
    When I grant "View" permission on "TextMate 2"
    And I commit my permissions changes
    And I sign out
    Given I sign in as "user@taskee.com"
    And I am on the projects page
    Then I should see the "TextMate 2" link
    
  Scenario: Creating tasks for a project
    When I grant "View" permission on "TextMate 2"
    And I grant "Create tasks" permission on "TextMate 2"
    And I commit my permissions changes
    And I sign out
    Given I sign in as "user@taskee.com"
    And I am on the projects page
    When I navigate to the "TextMate 2" project page
    And I start to create a new task
    And I enter the new task information
    Then I should be shown the task "created" verification
    And I should see the new task created by "user@taskee.com"

    
  Scenario: Updating a task for a project
    When I grant "View" permission on "TextMate 2"
    And I grant "Edit tasks" permission on "TextMate 2"
    And I commit my permissions changes
    And I sign out
    Given I sign in as "user@taskee.com"
    And I am on the projects page
    When I navigate to the "TextMate 2" project page
    And I navigate to the "Shiny!" task page
    And I choose to edit the task
    And I change the title of the task to "Original Bogus Name Test"
    Then I should be shown the task "updated" verification
    And I should be on the "Original Bogus Name Test" task page


  Scenario: Deleting a task for a project
    When I grant "View" permission on "TextMate 2"
    And I grant "Delete tasks" permission on "TextMate 2"
    And I commit my permissions changes
    And I sign out
    Given I sign in as "user@taskee.com"
    And I am on the projects page
    And I navigate to the "Shiny!" task page
    And I choose to delete the task
    Then I should be shown the task "deleted" verification
