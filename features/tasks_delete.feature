Feature: Deleting tasks
  In order to remove tasks
  As a user
  I want to press a button and make them disappear
  
  Background:
    Given there is a project called "TextMate 2"
    Given there are the following users:
      | email | password |
      | ronp@bbking.com | password |
    And I sign in as "ronp@bbking.com"
    And "ronp@bbking.com" can view the "TextMate 2" project
    And "ronp@bbking.com" can delete tasks in the "TextMate 2" project
    And "ronp@bbking.com" has created a task for this project:
      | title | description |
      | Make it shiny! | Gradients! Starbursts! Oh my! |
    Given I am on the projects page
    When I navigate to the "TextMate 2" project page
    And I navigate to the "Make it shiny!" task page

  Scenario: Deleting a task
    When I choose to delete the task
    Then I should be shown the task "deleted" verification
    And I should be on the project page for "TextMate 2"
    And I should not see the "Make it shiny!" task title
