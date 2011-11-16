Feature: Editing a user
  In order to change a user's details
  As an admin
  I want to be able to modify them through the admin UI
  
  Background:
    Given there are the following users:
      | email | password | admin |
      | admin@ticketee.com | password | true |
    And I sign in as "admin@ticketee.com"
    Given there are the following users:
      | email | password |
      | user@ticketee.com | password |
    Given I am on the homepage
    When I navigate to the admin subsite
    And I navigate to the "user@ticketee.com" user page
    And I choose to edit the user
  
  Scenario: Updating a user's details
    And I change the email of the user to "changed@travelpage.com"
    Then I should be shown the "user updated" verification
    And I should see user "changed@travelpage.com"
    And I should not see user "user@ticketee.com"

  Scenario: Toggling a user's admin ability
    When I change the user to an admin user
    Then I should be shown the "user updated" verification
    And I should see "user@ticketee.com" labeled as an admin user
  
  Scenario: Updating with an invalid email fails
    And I change the email of the user to "fakefakefake"
    Then I should be shown the "user not updated" verification
    And I should see the "user email valid" validation alert

