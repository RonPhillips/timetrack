Feature: Deleting projects
  In order to remove needless projects
  As a project manager
  I want to make them disappear
  
  Scenario: Deleting a project
    Given there is a project called "Death March"
    And I am on the projects page
    When I follow "Death March"
    And I follow "Delete Project"
    Then I should see "Project has been deleted."
    Then I should not see "Death March"
