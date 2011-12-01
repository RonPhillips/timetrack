Feature: Editing Journal Entries
  In order to update journal entry information
  As a user
  I want to be able to do that through an interface
  
  Background:
    Given there is a tag named "browser"
    And there is a tag named "visual"
    And there is a tag named "bogosity"
    And there are the following users:
      | email | password |
      | ronp@bbking.com | password |
    And I sign in as "ronp@bbking.com"
    And "ronp@bbking.com" has created a journal entry:
      | recorded_on | duration | note | tags |
      | 2011-11-30 | 5.25 | Blarting | browser visual |
    And I am on the journal entries page
    When I navigate to the journal entry page with note "Blarting"
    And I choose to edit the journal entry
  
  Scenario: Updating a journal entry
    And I set the journal entry "Note" to "Yawping and Blarting"
    And I save the journal entry changes
    Then I should be shown the journal entry "updated" verification
    Then I should be on the journal entry page with note "Yawping and Blarting"
    
  Scenario: Updating a journal entry with invalid attributes is bad
    And I set the journal entry "Duration" to ""
    And I save the journal entry changes
    Then I should be shown the journal entry "not updated" verification
    Then I should see the journal entry "duration cannot be blank" validation alert

  Scenario: Updating a journal entry with tags
    And I set the journal entry "Tags" to "browser bogosity"
    #Then show me the page
    And I save the journal entry changes
    Then I should be shown the journal entry "updated" verification
    And I should see "browser" under the "#tags" CSS path
    And I should see "bogosity" under the "#tags" CSS path
    And I should not see "visual" under the "#tags" CSS path

