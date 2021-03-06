Feature: Viewing projects
  In order to assign tickets to a project
  As a user
  I want to be able to see a list of available projects
  
  Background:
    Given there are the following users:
      | email | password |
      | user@ticketee.com | password |
    And I sign in as "user@ticketee.com"
    And there is a project called "Bogus View"
    And "user@ticketee.com" can view the "Bogus View" project
    And there is a project called "Big Nuthin'"
  
  Scenario: Listing all projects
    And I am on the projects page
    Then I should not see the "Big Nuthin'" project
    When I navigate to the "Bogus View" project page
    Then I should be on the project page for "Bogus View"
