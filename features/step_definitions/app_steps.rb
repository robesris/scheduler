Given /^the database is populated$/ do
  Factory.create(:instance, :name => "Naxxramas")
  Factory.create(:instance, :name => "Black Temple")
end


Given /^"([^\"]*)" from "([^\"]*)" is a "([^\"]*)" character$/ do |character_name, realm_name, faction_name|
  @realm = Factory.create(:realm, :name => realm_name)
  @faction = Factory.create(:horde)
  @character = Factory.create(:character, :name => character_name, :realm => @realm, :faction => @faction)
  
  #Should be stubbed out for the purposes of this feature, as it's not really the focus of the feature
  #@character.get_remote_xml
  #assert_match("Horde", @character.faction.name)
end

Given /^there is a raid entitled "([^\"]*)"$/ do |title|
  @raid = Factory.create(:raid, :title => title)
end

Given /^the raid is not protected$/ do
  @raid.protected = false
  @raid.save!
end

Given /^the raid is searchable$/ do
  @raid.searchable = true
  @raid.save!
end

When /^I fill in raid slot number "([^\"]*)" with "([^\"]*)"$/ do |slot, name|
  pending # express the regexp above with the code you wish you had
end
