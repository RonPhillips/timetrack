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
    When I navigate to the "Change a task's state" task page
    And I create the comment "Added a comment!"
    Then I should be shown the comment "created" verification
    And I should see the "Added a comment!" comment in the "#comments" ID

  Scenario: Creating an invalid comment
    When I navigate to the "Change a task's state" task page
    And I create the comment ""
    Then I should be shown the comment "not created" verification
    And I should see the comment text presence validation alert
