Feature: Editing Stretches
  In order to update stretch information
  As a user
  I want to be able to do that through an interface
  
  Background:
    Given there is a stretch noted "Blarting"
    And I am on the stretches page
    When I follow "Blarting"
    And I follow "Edit Stretch"
  
  Scenario: Updating a stretch
    And I fill in "Note" with "Yawping and Blarting"
    And I press "Update Stretch"
    Then I should see "Stretch has been updated."
    Then I should be on the stretch page for "Yawping and Blarting"
    
  Scenario: Updating a stretch with invalid attributes is bad
    And I fill in "Duration" with ""
    And I press "Update Stretch"
    Then I should see "Stretch has not been updated."
