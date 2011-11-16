Feature: Deleting activities
  In order to remove needless activities
  As an admin
  I want to make them disappear
  
  Scenario: Deleting an activity
    Given there is an activity called "Meaningless Blarting"
    And I am on the activities page
    When I navigate to the "Meaningless Blarting" activity page
    And I delete the activity
    Then I should see the activity deleted alert
    And I should not see the "Meaningless Blarting" activity
