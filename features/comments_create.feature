Feature: Creating comments
  In order to update a task's progress
  As a user
  I want to leave comments

  Background:
    Given there are the following users:
      | email | password |
      | user@taskee.com | password |
    And I sign in as "user@taskee.com"
    And there is a project called "Taskee"
    And "user@taskee.com" can view the "Taskee" project
    And "user@taskee.com" has created a task for this project:
      | title | description |
      | Change a task's state | You should be able to create a comment |
    And I navigate to the "Taskee" project page
    Given there is a state called "Open"
    And "user@taskee.com" can tag the "Taskee" project
        
  Scenario: Creating a comment
    When I navigate to the "Change a task's state" task page
    And I comment "Added a comment!"
    And I save the comment
    Then I should be shown the comment "created" verification
    And I should see "Added a comment!" under the "#comments" CSS path

  Scenario: Creating an invalid comment
    When I navigate to the "Change a task's state" task page
    And I comment ""
    And I save the comment
    Then I should be shown the comment "not created" verification
    And I should see the comment text presence validation alert
    
  Scenario: Changing a task's state
    Given "user@taskee.com" can change states on the "Taskee" project
    When I navigate to the "Change a task's state" task page
    And I comment "This is a real issue"
    And I set the state to "Open"
    And I save the comment
    Then I should be shown the comment "created" verification
    And I should see "Open" under the "#task .state" CSS path
    And I should see "State: Open" under the "#comments" CSS path
    
  Scenario: A user without permission cannot change the state
    When I navigate to the "Change a task's state" task page
    Then I should not see the "#comment_state_id" element
    
  Scenario: Adding a tag to a task
    When I navigate to the "Change a task's state" task page
    Then I should not see "bug" under the "#task #tags" CSS path
    And I comment "Adding the bug tag"
    And I set the comment "Tags" to "bug"
    And I save the comment
    #Then show me the page
    Then I should be shown the comment "created" verification
    And I should see "bug" under the "#task #tags" CSS path
