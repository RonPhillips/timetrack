Feature: Deleting tasks
  In order to remove tasks
  As a user
  I want to press a button and make them disappear
  
  Background:
  Given there is a project called "TextMate 2"
  And that project has a task:
    | title | description |
    | Make it shiny! | Gradients! Starbursts! Oh my! |
  Given I am on the projects page
  When I follow "TextMate 2"
  And I follow "Make it shiny!"

  Scenario: Deleting a task
  When I follow "Delete Task"
  Then I should see "Task has been deleted."
  And I should be on the project page for "TextMate 2"
