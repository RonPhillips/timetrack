Feature: Viewing Stretches
  In order to find a stretch
  As a user
  I want to be able to see a list of available stretches
  
  Scenario: Listing all stretches
    Given there is a stretch noted "Yawping"
    And I am on the stretches page
    When I follow "Yawping"
    Then I should be on the stretch page for "Yawping"
