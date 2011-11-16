Feature: Editing Stretches
  In order to update stretch information
  As a user
  I want to be able to do that through an interface
  
  Background:
    Given there is a stretch noted "Blarting"
    And I am on the stretches page
    When I navigate to the stretch page with note "Blarting"
    And I choose to edit the stretch
  
  Scenario: Updating a stretch
    And I change the stretch note to "Yawping and Blarting"
    Then I should be shown the "stretch updated" verification
    Then I should be on the stretch page with note "Yawping and Blarting"
    
  Scenario: Updating a stretch with invalid attributes is bad
    And I change the stretch duration to ""
    Then I should be shown the "stretch not updated" verification
    Then I should see the stretch "duration cannot be blank" validation alert

