Feature: Editing Journal Entries
  In order to update journal entry information
  As a user
  I want to be able to do that through an interface
  
  Background:
    Given there is a journal entry noted "Blarting"
    And I am on the journal entries page
    When I navigate to the journal entry page with note "Blarting"
    And I choose to edit the journal entry
  
  Scenario: Updating a journal entry
    And I change the journal entry note to "Yawping and Blarting"
    Then I should be shown the "journal entry updated" verification
    Then I should be on the journal entry page with note "Yawping and Blarting"
    
  Scenario: Updating a journal entry with invalid attributes is bad
    And I change the journal entry duration to ""
    Then I should be shown the "journal entry not updated" verification
    Then I should see the journal entry "duration cannot be blank" validation alert

