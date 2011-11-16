Feature: Deleting users
  In order to remove users
  As an admin
  I want to click a button in the admin UI and delete them
  
  Background:
    Given there are the following users:
      | email | password | admin |
      | admin@ticketee.com | password | true |
      | user@ticketee.com | password | false |
    And I sign in as "admin@ticketee.com"
    Given I am on the homepage
    When I navigate to the admin subsite

  Scenario: Deleting a user
    And I navigate to the "user@ticketee.com" user page
    And I choose to delete the user
    Then I should be shown the "user deleted" verification
    
  Scenario: Users cannot delete themselves
    And I navigate to the "admin@ticketee.com" user page
    And I choose to delete the user
    Then I should be shown the "user cannot delete self" verification
