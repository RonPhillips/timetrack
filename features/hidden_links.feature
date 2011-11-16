Feature: Hidden Links
  In order to clean up the user experience
  As the system
  I want to hide links from users who can't act on them
  
  Background:
    Given there are the following users:
      | email | password | admin |
      | user@taskee.com | password | false |
      | admin@taskee.com | password | true |
    And there is a project called "TextMate 2"
    And "user@taskee.com" has created a task for this project:
      | title | description |
      | Shiny! | My eyes! My eyes! |
    And "user@taskee.com" can view the "TextMate 2" project
  
  Scenario: New project link is hidden for non-signed-in users
    Given I am on the projects page
    Then I should not see the "New Project" link
  
  Scenario: New project link is hidden for signed-in users
    Given I sign in as "user@taskee.com"
    And I am on the projects page
    Then I should not see the "New Project" link
  
  Scenario: New project link is shown to admins
    Given I sign in as "admin@taskee.com"
    And I am on the projects page
    Then I should see the "New Project" link
    
  Scenario: Edit project link is hidden for signed-in users
    Given I sign in as "user@taskee.com"
    And I am on the projects page
    When I navigate to the "TextMate 2" project page
    Then I should not see the "Edit Project" link
  
  Scenario: Edit project link is shown to admins
    Given I sign in as "admin@taskee.com"
    And I am on the projects page
    When I navigate to the "TextMate 2" project page
    Then I should see the "Edit Project" link
  
  Scenario: Delete project link is hidden for signed-in users
    Given I sign in as "user@taskee.com"
    And I am on the projects page
    When I navigate to the "TextMate 2" project page
    Then I should not see the "Delete Project" link
  
  Scenario: Delete project link is shown to admins
    Given I sign in as "admin@taskee.com"
    And I am on the projects page
    When I navigate to the "TextMate 2" project page
    Then I should see the "Delete Project" link
    
  Scenario: New task link is shown to a user with permission
    Given "user@taskee.com" can view the "TextMate 2" project
    And "user@taskee.com" can create tasks on the "TextMate 2" project
    And I sign in as "user@taskee.com"
    And I am on the projects page
    When I navigate to the "TextMate 2" project page
    Then I should see the "New Task" link
  
  Scenario: New task link is hidden from a user without permission
    Given "user@taskee.com" can view the "TextMate 2" project
    And I sign in as "user@taskee.com"
    And I am on the projects page
    When I navigate to the "TextMate 2" project page
    Then I should not see the "New Task" link
  
  Scenario: New task link is shown to admins
    Given I sign in as "admin@taskee.com"
    And I am on the projects page
    When I navigate to the "TextMate 2" project page
    Then I should see the "New Task" link
    
  Scenario: Edit task link is shown to a user with permission
    Given "user@taskee.com" can view the "TextMate 2" project
    And "user@taskee.com" can edit tasks on the "TextMate 2" project
    And I sign in as "user@taskee.com"
    And I am on the projects page
    When I navigate to the "TextMate 2" project page
    And I navigate to the "Shiny!" task page
    Then I should see the "Edit" link
  
  Scenario: Edit task link is hidden from a user without permission
    Given "user@taskee.com" can view the "TextMate 2" project
    And I sign in as "user@taskee.com"
    And I am on the projects page
    When I navigate to the "TextMate 2" project page
    And I navigate to the "Shiny!" task page
    Then I should not see the "Edit" link
 
  Scenario: Edit task link is shown to admins
    Given I sign in as "admin@taskee.com"
    And I am on the projects page
    When I navigate to the "TextMate 2" project page
    And I navigate to the "Shiny!" task page
    Then I should see the "Edit" link
    
  Scenario: Delete task link is shown to a user with permission
    Given "user@taskee.com" can view the "TextMate 2" project
    And "user@taskee.com" can delete tasks in the "TextMate 2" project
    And I sign in as "user@taskee.com"
    And I am on the projects page
    When I navigate to the "TextMate 2" project page
    And I navigate to the "Shiny!" task page
    Then I should see the "Delete" link
  
  Scenario: Delete task link is hidden from a user without permission
    Given "user@taskee.com" can view the "TextMate 2" project
    And I sign in as "user@taskee.com"
    And I am on the projects page
    When I navigate to the "TextMate 2" project page
    And I navigate to the "Shiny!" task page
    Then I should not see the "Delete" link
  
  Scenario: Delete task link is shown to admins
    Given I sign in as "admin@taskee.com"
    And I am on the projects page    
    When I navigate to the "TextMate 2" project page
    And I navigate to the "Shiny!" task page
    Then I should see the "Delete" link
        
