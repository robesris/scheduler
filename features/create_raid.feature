Feature: Create Raid
  In order to facilitate raid signup
  As a raid organizer
  I want to schedule a raid
  
  Background:
    Given the database is populated
  
  Scenario Outline: schedule a raid
    Given I am on "raids"
    And "<character_name>" from "<realm_name>" is a "<faction_name>" character
    When I follow "New Raid"
    And I select "<raid_name>" from "Instance"
    And I fill in "Raid Start Date and Time" with "<raid_date> <raid_time>"
    And I fill in "Creator" with "1"
    And I fill in "Code" with "My New Raid"
    And I press "Create"
    Then I should see "Raid created successfully!"
    And I should see "<raid_name>"
    And I should see "<raid_date>"
    And I should see "<raid_time>"
    
  Examples:
      | realm_name | character_name | faction_name | raid_name    | raid_date | raid_time |
      | Gorefiend  | Rexerengeti    | Horde        | Naxxramas    | 1/31/2010 | 3:00 PM   |
      | Gorefiend  | Forgarion      | Horde        | Black Temple | 2/20/2010 | 4:45 AM   |

    
