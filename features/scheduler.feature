Feature: Navigation
  In order effectively use the application
  As a player and/or raid organizer
  I want to navigate the site
  
  Scenario: Go to the homepage
    Given the database is populated
    When I am on the homepage
    Then I should see "Upcoming Raids"
    And I should see "join"
    And I should see "New raid"
    