Feature: Deleting stretches
  In order to remove needless stretches
  As an admin
  I want to make them disappear
  
  Scenario: Deleting a stretch
    Given there is a stretch noted "Meaningless Blarting"
    And I am on the stretches page
    
    When I navigate to the stretch page with note "Meaningless Blarting"
    And I delete the stretch
    Then I should be shown the "stretch deleted" verification
    And I should not see the stretch with note "Meaningless Blarting"

