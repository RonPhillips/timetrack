Feature: Editing Activities
  In order to update activity information
  As a user
  I want to be able to do that through an interface
  
  Background:
    Given there is an activity called "Blarting"
    And I am on the activities page
    When I follow "Blarting"
    And I follow "Edit Activity"
  
  Scenario: Updating an activity
    And I fill in "Name" with "Yawping and Blarting"
    And I press "Update Activity"
    Then I should see "Activity has been updated."
    Then I should be on the activity page for "Yawping and Blarting"
    
  Scenario: Updating a activity with invalid attributes is bad
    And I fill in "Name" with ""
    And I press "Update Activity"
    Then I should see "Activity has not been updated."
