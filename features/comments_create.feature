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


  Scenario: Creating a comment
    #Then show me the page
    When I navigate to the "Change a task's state" task page
#    And I fill in "Text" with "Added a comment!"
#    And I press "Create Comment"
#    Then I should see "Comment has been created."
#    Then "Added a comment!" should appear in the "comments" section

#  Scenario: Creating an invalid comment
#    When I follow "Change a task's state"
#    And I press "Create Comment"
#    Then I should see "Comment has not been created."
#    And I should see "Text can't be blank"
