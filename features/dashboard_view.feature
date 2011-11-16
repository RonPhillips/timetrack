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
    And I sign in as "user@ticketee.com"
    Then I should see the "Projects" link
    
  Scenario: I should see a link to the Activities page
    Then I should see the "Activities" link
    
  Scenario: I should see a link to the Stretches page
    Then I should see the "Stretches" link
