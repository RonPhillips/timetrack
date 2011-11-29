Feature: Creating journal entries
  In order to have journal entries that show how I spent time
  As a user
  I want to create them easily
  
  Background:
    Given I am on the journal entries page
    And I choose to create a new journal entry

  Scenario: Creating a journal entry
    And I enter a new journal entry
    Then I should be shown the journal entry "created" verification
    And I should be on the journal entry page for the new journal entry
   
  Scenario: Creating a journal entry without a duration should fail
    And I enter a new journal entry with no duration
    Then I should be shown the journal entry "not created" verification
    And I should see the journal entry "duration cannot be blank" validation alert

