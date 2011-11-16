Feature: Signing in
  In order to use the site
  As a user
  I want to be able to sign in
  
  Scenario: Signing in via form
    Given there are the following users:
    | email | password | admin |
    | user@ticketee.com | password | false |
    And I sign in as "user@ticketee.com"
    Then I should be shown the sign in success verification
    
  Scenario: Signing in admin via form
    Given there are the following users:
    | email | password | admin |
    | admin@ticketee.com | password | true |
    And I sign in as "admin@ticketee.com"
    Then I should be shown the sign in success verification
