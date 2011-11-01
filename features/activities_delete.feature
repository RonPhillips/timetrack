Feature: Deleting activities
  In order to remove needless activities
  As an admin
  I want to make them disappear
  
  Scenario: Deleting an activity
    Given there is an activity called "Meaningless Blarting"
    And I am on the activities page
    When I follow "Meaningless Blarting"
    And I follow "Delete Activity"
    Then I should see "Activity has been deleted."
    Then I should not see "Meaningless Blarting"
