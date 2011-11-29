Feature: Viewing JournalEntries
  In order to find a journal entry
  As a user
  I want to be able to see a list of available journal entries
  
  Scenario: Listing all journal entries
    Given there is a journal entry noted "Yawping"
    And I am on the journal entries page
    When I navigate to the journal entry page with note "Yawping"
    Then I should be on the journal entry page with note "Yawping"
