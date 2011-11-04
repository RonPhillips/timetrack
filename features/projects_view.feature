Feature: Viewing projects
  In order to assign tickets to a project
  As a user
  I want to be able to see a list of available projects
  
  Background:
    Given there are the following users:
      | email | password |
      | user@ticketee.com | password |
    And I am signed in as them
    And there is a project called "Bogus View"
    And "user@ticketee.com" can view the "Bogus View" project
  
  Scenario: Listing all projects
    And I am on the projects page
    When I follow "Bogus View"
    Then I should be on the project page for "Bogus View"
