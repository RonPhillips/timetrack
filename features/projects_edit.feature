Feature: Editing Projects
  In order to update project information
  As a user
  I want to be able to do that through an interface
  
  Background:
    Given there is a project called "Original Bogus"
    Given there are the following users:
      | email | password | admin |
      | admin@timetracker.com | password | true |
    And I sign in as "admin@timetracker.com"
    And I am on the projects page
    When I navigate to the "Original Bogus" project edit page
  
  Scenario: Updating a project
    And I change the name of the project to "Original Bogus Name Test"
    Then I should be shown the project updated verification
    And I should be on the project page for "Original Bogus Name Test"

  Scenario: Updating a project with invalid attributes is bad
    And I change the name of the project to ""
    Then I should see the project update denied alert
    And I should see the project name presence validation alert

