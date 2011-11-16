Feature: Creating Users
  In order to add new users to the system
  As an admin
  I want to be able to add them through the admin UI
  
  Background:
    Given there are the following users:
      | email | password | admin |
      | admin@ticketee.com | password | true |
    And I sign in as "admin@ticketee.com"
    Given I am on the homepage
    When I navigate to the admin subsite
    And I navigate to the admin/users page
    And I choose to create a user
  
  Scenario: Creating a new user
    And I create a user 
    Then I should be shown the "user created" verification
    And I should see the new user
  
  Scenario: Leaving email blank results in an error
    When I create a user with a blank email
    Then I should be shown the "user not created" verification
    And I should see the "user title presence" validation alert
    
  Scenario: Creating an admin user
    And I create an admin user
    Then I should see the new user labeled as admin

