Feature: Creating stretches
  In order to have stretches that show how I spent time
  As a user
  I want to create them easily
  
  Background:
    #Given there are the following users:
      #| email              | password | admin |
      #| admin@timetracker.com | password | true  |
    #And I am signed in as them
    Given I am on the stretches page
    When I follow "New Stretch"

  Scenario: Creating a stretch
    And I fill in "Recorded on" with "12/04/11"
    And I fill in "Duration" with "5.25"
    And I fill in "Starting quarter" with "32"
    And I fill in "Note" with "Test stretch creation"
    And I press "Create Stretch"
    Then I should see "Stretch has been created."
    And I should be on the stretch page for "Test stretch creation"
    And I should see "Test stretch creation - Stretches - Timetracker"
    
  Scenario: Creating a stretch without a duration
    And I press "Create Stretch"
    Then I should see "Stretch has not been created."
    And I should see "Duration can't be blank"
