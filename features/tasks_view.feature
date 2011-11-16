Feature: Viewing tasks
  In order to view the tasks for a project
  As a user
  I want to see them on that project's page
  
  Background:
    Given there is a project called "TextMate 2"
    Given there are the following users:
      | email | password |
      | user@blagger.com | password |
    And I sign in as "user@blagger.com"
    And "user@blagger.com" can view the "TextMate 2" project
    And "user@blagger.com" has created a task for this project:
      | title | description |
      | Make it shiny! | Gradients! Starbursts! Oh my! |
    And there is a project called "Internet Explorer"
    And "user@blagger.com" can view the "Internet Explorer" project
    And "user@blagger.com" has created a task for this project:
      | title | description |
      | Standards compliance | Isn't a joke. |
    And I am on the projects page
  
  Scenario: Viewing tasks for a given project
    When I navigate to the "TextMate 2" project page
    Then I should see the "Make it shiny!" task in the "#tasks" ID
    And I should not see the "Standards compliance" task title
    When I am on the homepage
    And I navigate to the "Internet Explorer" project page
    Then I should see the "Standards compliance" task in the "#tasks" ID
    And I should not see the "Make it shiny!" task title
  

