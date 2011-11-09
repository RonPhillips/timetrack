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
