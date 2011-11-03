Feature: Creating Tasks
  In order to create tasks for projects
  As a user
  I want to be able to select a project and do that
  
  Background:
    Given there is a project called "Project with Tasks"
    And there are the following users:
      | email | password |
      | user@bogus.com | password |
    And I am on the projects page
    When I follow "Project with Tasks"
    And I follow "New Task"
    Then I should see "You need to sign in or sign up before continuing."
    When I fill in "Email" with "user@bogus.com"
    And I fill in "Password" with "password"
    And I press "Sign in"
    Then I should see "New Task"
  
  Scenario: Creating a task
    When I fill in "Title" with "Complete Filing Documents"
    And I fill in "Description" with "Fill out all the documents required for a filing"
    And I press "Create Task"
    Then I should see "Task has been created."
    And I should see "Created by user@bogus.com"
  
  Scenario: Creating a task without valid attributes fails
    When I press "Create Task"
    Then I should see "Task has not been created."
    And I should see "Title can't be blank"
    And I should see "Description can't be blank"
    
  Scenario: Description must be longer than 10 characters
    When I fill in "Title" with "Complete Filing Documents"
    And I fill in "Description" with "Go on!"
    And I press "Create Task"
    Then I should see "Task has not been created."
    And I should see "Description is too short"
