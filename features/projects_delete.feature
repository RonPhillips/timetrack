Feature: Deleting projects
  In order to remove needless projects
  As a project manager
  I want to make them disappear
  
  Scenario: Deleting a project
    Given there is a project called "Death March"
    Given there are the following users:
      | email | password | admin |
      | admin@timetracker.com | password | true |
    And I sign in as "admin@timetracker.com"
    And I am on the projects page
    When I navigate to the "Death March" project page
    And I delete the project
    Then I should see the project deleted alert
    And I should not see the "Death March" project
