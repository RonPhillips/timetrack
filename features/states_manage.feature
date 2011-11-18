Feature: Managing states
  In order to change information about a state
  As an admin
  I want to be able to set a state's name and default status
  
  Background:
    Given I have run the seed task
    And I sign in as "admin@timetrack.com"
  
  Scenario: Marking a state as default
    Given I am on the homepage
    And I navigate to the admin/states page
    And I follow "Make default" for the "New" state
    Then I should be shown the state "new is default" verification
