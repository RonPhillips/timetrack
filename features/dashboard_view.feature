Feature: Viewing the dashboard
  In order to navigate to various models
  As a user
  I want to be able to see a list of available models
  
  Background: Listing all models
    Given I am on the homepage
    
  Scenario: If I am signed in, then I should see a link to the Projects page
    Given there are the following users:
      | email | password |
      | user@ticketee.com | password |
    And I am signed in as them
    When I follow "Projects"
    Then I should be on the projects page
    
  Scenario: I should see a link to the Activities page
    When I follow "Activities"
    Then I should be on the activities page
    
  Scenario: I should see a link to the Stretches page
    When I follow "Stretches"
    Then I should be on the stretches page
