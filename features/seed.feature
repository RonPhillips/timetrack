Feature: Seed Data
  In order to fill the database with the basics
  As the system
  I want to run the seed task

  Scenario: The basics
    Given I have run the seed task
    And I sign in as "admin@timetrack.com"
    And I am on the projects page
    Then I should see the "Timetrack Seed Project" link
