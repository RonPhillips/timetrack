Feature: Editing tasks
  In order to alter task information
  As a user
  I want a form to edit the tasks

  Background:
    Given there is a project called "TextMate 2"
    Given there are the following users:
      | email | password |
      | ronp@bbking.com | password |
    And I sign in as "ronp@bbking.com"
    And "ronp@bbking.com" can view the "TextMate 2" project
    And "ronp@bbking.com" can edit tasks in the "TextMate 2" project
    And "ronp@bbking.com" has created a task for this project:
      | title | description |
      | Make it shiny! | Gradients! Starbursts! Oh my! |
    Given I am on the projects page
    When I navigate to the "TextMate 2" project page
    And I navigate to the "Make it shiny!" task page
    And I choose to edit the task
      
  Scenario: Updating a task
    And I change the title of the task to "Original Bogus Name Test"
    Then I should be shown the task "updated" verification
    And I should be on the "Original Bogus Name Test" task page
    And I should not see the "Make it shiny!" task title

  Scenario: Updating a task with invalid information
    When I change the title of the task to ""
    Then I should see the task not "updated" alert


