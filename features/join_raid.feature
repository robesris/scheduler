Feature: Join Raid
  In order to participate in a scheduled raid
  As a player
  I want to sign up for a raid
  
  Background:
    Given the database is populated
    
  Scenario: Sign up a Horde character for a public raid
    Given "Rexerengeti" from "Gorefiend" is a "Horde" character
    And there is a raid entitled "Fun Raid"
    And the raid is not protected
    And the raid is searchable
    And I am on "raids"
    When I follow "join"
    #And I fill in raid slot number "1" with "Rexerengeti"
    And I fill in "Character Name" with "Rexerengeti"
    And I press "Save"
    Then I should see "You successfully signed up for the raid!"
    And I should see "Rexerengeti"
    