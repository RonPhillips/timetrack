Feature: Creating comments
  In order to update a project's progress
  As a user
  I want to leave comments

#  Background:
#    Given there are the following users:
#      | email | password |
#      | user@projectee.com | password |
#    And I sign in as "user@projectee.com"
#    And there is a project called "Projectee"
#    And "user@projectee.com" can view the "Projectee" project
#    And I navigate to the "Projectee" project page
#    Given there is a state called "Open"
#    And "user@projectee.com" can tag the "Projectee" project
#        
#  Scenario: Creating a comment
#    When I comment "Added a comment!"
#    And I save the comment
#    Then I should be shown the comment "created" verification
#    And I should see "Added a comment!" under the "#comments" CSS path

#  Scenario: Creating an invalid comment
#    When I comment ""
#    And I save the comment
#    Then I should be shown the comment "not created" verification
#    And I should see the comment text presence validation alert
#    
#  Scenario: Changing a project's state
#    Given "user@projectee.com" can change states on the "Projectee" project
#    And I comment "This is a real issue"
#    And I set the state to "Open"
#    And I save the comment
#    Then I should be shown the comment "created" verification
#    And I should see "Open" under the "#project .state" CSS path
#    And I should see "State: Open" under the "#comments" CSS path
#    
#  Scenario: A user without permission cannot change the state
#    Then I should not see the "#comment_state_id" element
#    
#  Scenario: Adding a tag to a project
#    Then I should not see "bug" under the "#project #tags" CSS path
#    And I comment "Adding the bug tag"
#    And I set the comment "Tags" to "bug"
#    And I save the comment
#    #Then show me the page
#    Then I should be shown the comment "created" verification
#    And I should see "bug" under the "#project #tags" CSS path
