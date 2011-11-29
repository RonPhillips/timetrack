Feature: Searching
  In order to find specific tasks
  As a user
  I want to enter a search query and get results

  Background:
    Given there are the following users:
      | email | password |
      | user@taskee.com | password |
    And I sign in as "user@taskee.com"
    And there is a project called "Taskee"
    And "user@taskee.com" can view the "Taskee" project
    And "user@taskee.com" can tag the "Taskee" project
    And "user@taskee.com" has created a task for this project:
      | title | description | tags |
      | Tag! | Hey! You're it! | iteration_1 |
    And "user@taskee.com" has created a task for this project:
      | title | description | tags |
      | Tagged! | Hey! I'm it now! | iteration_2 |
    Given I navigate to the "Taskee" project page
    
  Scenario: Finding by task
    When I enter the task search "tagg"
    And I send the search request
    #Then show me the page
    Then I should not see "Tag!" under the "#tasks" CSS path
    And I should see "Tagged!" under the "#tasks" CSS path
    
  Scenario: Finding by tag
    When I enter the tag search "1"
    And I send the search request
    #Then show me the page
    Then I should see "Tag!" under the "#tasks" CSS path
    And I should not see "Tagged!" under the "#tasks" CSS path
