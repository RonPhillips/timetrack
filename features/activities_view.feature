Feature: Viewing Activities
  In order to find an activity
  As a user
  I want to be able to see a list of available activities
  
  Scenario: Listing all activities
    Given there is an activity called "Yawping"
    And I am on the activities page
    When I follow "Yawping"
    Then I should be on the activity page for "Yawping"
