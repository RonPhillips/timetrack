Feature: Creating stretches
  In order to have stretches that show how I spent time
  As a user
  I want to create them easily
  
  Background:
    Given I am on the stretches page
    And I choose to create a new stretch

  Scenario: Creating a stretch
    And I enter a new stretch
    Then I should be shown the stretch "created" verification
    And I should be on the stretch page for the new stretch
   
  Scenario: Creating a stretch without a duration should fail
    And I enter a new stretch with no duration
    Then I should be shown the stretch "not created" verification
    And I should see the stretch "duration cannot be blank" validation alert

