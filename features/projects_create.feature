Feature: Creating projects
  In order to have projects to assign tasks to
  As a user
  I want to create them easily
  
  Background:
    Given there are the following users:
      | email              | password | admin |
      | admin@timetracker.com | password | true  |
    And I sign in as "admin@timetracker.com"
    And I am on the projects page
    When I navigate to the new project creation page
  
  Scenario: Creating a project
    And I create a new project
    Then I should be shown the project created verification
    And I should be on the project page for the new project
    
  Scenario: Creating a project without a name
    And I create a new project without a name
    Then I should see the project creation denied alert
    And I should see the project name presence validation alert
    

