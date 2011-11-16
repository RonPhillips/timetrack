Feature: Editing Activities
  In order to update activity information
  As a user
  I want to be able to do that through an interface
  
  Background:
    Given there is an activity called "Blarting"
    And I am on the activities page
    When I navigate to the "Blarting" activity edit page
  
  Scenario: Updating an activity
    And I change the name of the activity to "Yawping and Blarting"
    Then I should be shown the activity updated verification
    And I should be on the activity page for "Yawping and Blarting"
    
  Scenario: Updating an activity with invalid attributes is bad
    And I change the name of the activity to ""
    Then I should see the activity update denied alert
    And I should see the activity name presence validation alert

