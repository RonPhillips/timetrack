Feature: Creating Tasks
  In order to create tasks for projects
  As a user
  I want to be able to select a project and do that
  
  Background:
    Given there is a project called "Project with Tasks"
    And there are the following users:
      | email | password |
      | user@bogus.com | password |
    And I sign in as "user@bogus.com"
    And "user@bogus.com" can view the "Project with Tasks" project
    And "user@bogus.com" can create tasks in the "Project with Tasks" project
    And "user@bogus.com" can tag the "Project with Tasks" project
    And I am on the projects page
    When I navigate to the "Project with Tasks" project page
    And I start to create a new task

  Scenario: Creating a task
    And I enter the new task information
    Then I should be shown the task "created" verification
    And I should see the new task created by "user@bogus.com"
  
  Scenario: Creating a task without valid attributes fails
    And I create a new task without a name or description
    Then I should see the task not "created" alert
    And I should see the task title presence validation alert
    And I should see the task description presence validation alert
    
  Scenario: Description must be longer than 10 characters
    And I create a new task with a description shorter than 10 characters
    Then I should see the task not "created" alert
    And I should see the task description length validation alert

  Scenario: Creating a ticket with tags
    When I set the task "Title" to "Non-standards compliance"
    And I set the task "Description" to "My pages are ugly!"
    And I set the task "Tags" to "browser visual"
    And I save the new task
    Then I should be shown the task "created" verification
    And I should see "browser" under the "#task #tags" CSS path
    And I should see "visual" under the "#task #tags" CSS path
