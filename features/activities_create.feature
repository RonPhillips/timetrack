Feature: Creating activities
  In order to have activities to which I can assign timeslices
  As a user
  I want to create them easily
  
  Background:
    Given I am on the activities page
    When I navigate to the new activity creation page

  Scenario: Creating an activity
    And I create a new activity
    Then I should be shown the activity created verification
    And I should be on the activity page for the new activity
    
  Scenario: Creating an activity without a name
    And I create a new activity without a name
    Then I should see the activity creation denied alert
    And I should see the activity name presence validation alert

