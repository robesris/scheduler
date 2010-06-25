Feature: Join Raid
  In order to participate in a scheduled raid
  As a player
  I want to sign up for a raid
  
  Background:
    Given the database is populated
    
  Scenario: Sign up a Horde character for a public raid
    Given "Rexerengeti" from "Gorefiend" is a "Horde" character
    And there is a raid entitled "Fun Raid" on "Gorefiend"
    And the raid is not protected
    And the raid is searchable
    And I am on "raids"
    When I follow the "join" link for "Fun Raid"
    And I fill in "Character Name" with "Rexerengeti"
    And I select "Tank" from "Role"
    And I press "Sign Up"
    Then I should see "You successfully signed up for the raid!"
    And I should see "Rexerengeti"
    
  Scenario: View an existing raid
    Given there is a raid entitled "10 man icc"
    And "Jack" from "Medivh" is a "Horde" character
    And "Jill" from "Medivh" is a "Horde" character
    And "Arnold" from "Medivh" is a "Horde" character
    And "Jack" is signed up for "10 man icc" as a "Tank"
    And "Jill" is signed up for "10 man icc" as a "DPS"
    And "Arnold" is signed up for "10 man icc" as a "Healer"
    And I go to the raid details page for "10 man icc"
    Then I should see "10 man icc"
    And I should see "Jack"
    And I should see "Tank"
    And I should see "Jill"
    And I should see "DPS"
    And I should see "Arnold"
    And I should see "Healer"
    And I should see "Join Raid"
    And I should see "Edit Raid"
    And I should see "Back"
    
  Scenario: Sign up from the show raid page
    Given there is a raid entitled "Sunday Naxx" on "Lightning's Blade"
    And "Puppy" from "Lightning's Blade" is a "Horde" character
    And I am on the raid details page for "Sunday Naxx"
    And I follow "Join Raid"
    And I fill in "Character Name" with "Puppy"
    And I select "DPS" from "Role"
    And I press "Sign Up"
    Then I should see "You successfully signed up for the raid!"
    And I should see "Sunday Naxx"
    And I should see "Puppy"
    And I should see "DPS"
  