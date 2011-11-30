Feature: Creating journal entries
  In order to have journal entries that show how I spent time
  As a user
  I want to create them easily
  
  Background:
    Given I am on the journal entries page
    And I choose to create a new journal entry
    And I set the journal entry "Recorded on" to "12/04/11"
    And I set the journal entry "Note" to "Test Journal Entry creation"
    
  Scenario: Creating a journal entry
    And I set the journal entry "Duration" to "5.25"
    And I save the new journal entry
    Then I should be shown the journal entry "created" verification
    And I should be on the journal entry page for the new journal entry
   
  Scenario: Creating a journal entry without a duration should fail
    #And I enter a new journal entry with no duration
    And I save the new journal entry
    Then I should be shown the journal entry "not created" verification
    And I should see the journal entry "duration cannot be blank" validation alert
    
  Scenario: Creating a journal entry with tags
    Given there is a tag named "browser"
    And there is a tag named "visual"
    And I set the journal entry "Duration" to "5.25"
    And I set the journal entry "Tags" to "browser visual"
    And I save the new journal entry
    Then I should be shown the journal entry "created" verification
    And I should see "browser" under the "#tags" CSS path
    And I should see "visual" under the "#tags" CSS path

