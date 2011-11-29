Feature: Deleting tags
  In order to remove old tags
  As a user
  I want to click a button and make them go away
  
  Background:
    Given there are the following users:
      | email | password |
      | user@ticketee.com | password |
    And I sign in as "user@ticketee.com"
    And there is a project called "Ticketee"
    And "user@ticketee.com" can view the "Ticketee" project
    And "user@ticketee.com" can tag the "Ticketee" project
    And "user@ticketee.com" has created a task for this project:
      | title | description | tags |
      | A tag | Tagging a task! | this-tag-must-die |
    Given I am on the homepage
    And I navigate to the "Ticketee" project page
    And I navigate to the "A tag" task page
    
    @javascript
    Scenario: Deleting a tag
      When I choose to remove the "this-tag-must-die" tag
      Then I should not see "this-tag-must-die" under the "#tags" CSS path
