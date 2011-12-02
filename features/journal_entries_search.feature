Feature: Searching
  In order to find specific journal entries
  As a user
  I want to enter a search query and get results

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
      | 2011-11-30 | 5.25 | Excellent! | browser visual |
    And "ronp@bbking.com" has created a journal entry:
      | recorded_on | duration | note | tags |
      | 2011-12-05 | 5.25 | Bogus | bogosity visual |
    And I am on the journal entries page
    
  Scenario: Finding by journal entry note
    When I enter the "Note contains" search "cell"
    And I send the search request
    #Then show me the page
    Then I should not see "Bogus" under the "#entry_results" CSS path
    And I should see "Excellent!" under the "#entry_results" CSS path
    
  Scenario: Finding by tag
    When I enter the "Tag contains" search "brow"
    And I send the search request
    #Then show me the page
    Then I should not see "Bogus" under the "#entry_results" CSS path
    And I should see "Excellent!" under the "#entry_results" CSS path
    
  Scenario: Reporting results
    
  Scenario: Finding by date
    When I enter the "Recorded >=" search "2011-11-30"
    And I enter the "Recorded <=" search "2011-12-01"
    And I send the search request
    #Then show me the page
    Then I should not see "Bogus" under the "#entry_results" CSS path
    And I should see "Excellent!" under the "#entry_results" CSS path
    
#  Scenario: Clicking a tag goes to search results
#    #Then show me the page
#    And I follow "browser" under ".tags" CSS path
#    Then I should not see "Bogus" under the "#entry_results" CSS path
#    And I should see "Excellent!" under the "#entry_results" CSS path

