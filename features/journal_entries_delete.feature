Feature: Deleting journal entries
  In order to remove needless journal entries
  As an admin
  I want to make them disappear
  
  Scenario: Deleting a journal entry
    Given there is a journal entry noted "Meaningless Blarting"
    And I am on the journal entries page
    
    When I navigate to the journal entry page with note "Meaningless Blarting"
    And I delete the journal entry
    Then I should be shown the "journal entry deleted" verification
    And I should not see the journal entry with note "Meaningless Blarting"

