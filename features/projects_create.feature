Feature: Creating projects
  In order to have projects to assign tasks to
  As a user
  I want to create them easily
  
  Background:
    #Given there are the following users:
      #| email              | password | admin |
      #| admin@timetracker.com | password | true  |
    #And I am signed in as them
    Given I am on the homepage
    When I follow "New Project"

  Scenario: Creating a project
    And I fill in "Name" with "Bogus Project"
    And I press "Create Project"
    Then I should see "Project has been created."
    And I should be on the project page for "Bogus Project"
    And I should see "Bogus Project - Projects - Timetracker"
    
  Scenario: Creating a project without a name
    And I press "Create Project"
    Then I should see "Project has not been created."
    And I should see "Name can't be blank"
