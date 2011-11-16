Feature: Signing up
  In order to be attributed for my work
  As a user
  I want to be able to sign up
  
  Scenario: Signing up
    Given I am on the homepage
    When I navigate to the user sign up page
    And I sign up as a new user
    Then I should be shown the user sign up success verification

