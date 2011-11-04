Feature: Editing tasks
  In order to alter task information
  As a user
  I want a form to edit the tasks

  Background:
    Given there is a project called "TextMate 2"
    Given there are the following users:
      | email | password |
      | ronp@bbking.com | password |
    And I am signed in as them
    And "ronp@bbking.com" can view the "TextMate 2" project
    And "ronp@bbking.com" has created a task for this project:
      | title | description |
      | Make it shiny! | Gradients! Starbursts! Oh my! |
    Given I am on the projects page
    When I follow "TextMate 2"
    And I follow "Make it shiny!"
    When I follow "Edit Task"
      
  Scenario: Updating a task
    When I fill in "Title" with "Make it really shiny!"
    And I press "Update Task"
    Then I should see "Task has been updated."
    And I should see "Make it really shiny!"
    But I should not see "Make it shiny!"

  Scenario: Updating a task with invalid information
    When I fill in "Title" with ""
    And I press "Update Task"
    Then I should see "Task has not been updated." 
