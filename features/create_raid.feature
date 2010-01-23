Feature: Create Raid
  In order to facilitate raid signup
  As a raid organizer
  I want to schedule a raid
  
  Scenario Outline: schedule a raid
    Given I am on "raids"
    And "<character_name>" is a Horde character
    When I follow "New Raid"
    Then I can schedule a "<raid_name>" run for "<raid_time>"
    
  Examples:
      | character_name | raid_name    | raid_time |
      | Rexerengeti    | Naxxramas    | 1312010   |
      | Forgarion      | Black Temple | 2202010   |

    
