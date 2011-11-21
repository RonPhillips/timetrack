Feature: Creating states
  In order to be able to specify other states for ticket
  As an admin
  I want to add them to the application
  
  Background:
    Given there are the following users:
    | email | password | admin |
    | admin@ticketee.com | password | true |
    And I sign in as "admin@ticketee.com"
  
  Scenario: Creating a state
    When I navigate to the admin subsite
    And I navigate to the admin/states page
    And I start to create a new state
    And I create a "Dubious" state
    Then I should be shown the state "created" verification

