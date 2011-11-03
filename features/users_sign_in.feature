Feature: Signing in
  In order to use the site
  As a user
  I want to be able to sign in
  
  Scenario: Signing in via form
    Given there are the following users:
    | email | password |
    | user@ticketee.com | password |
    And I am signed in as them
    
