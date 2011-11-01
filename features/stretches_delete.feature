Feature: Deleting stretches
  In order to remove needless stretches
  As an admin
  I want to make them disappear
  
  Scenario: Deleting a stretch
    Given there is a stretch noted "Meaningless Blarting"
    And I am on the stretches page
    When I follow "Meaningless Blarting"
    And I follow "Delete Stretch"
    Then I should see "Stretch has been deleted."
    Then I should not see "Meaningless Blarting"
