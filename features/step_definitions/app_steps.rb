Given /^the database is populated$/ do
  Factory.create(:instance, :name => "Naxxramas")
  Factory.create(:instance, :name => "Black Temple")
  Factory.create(:raid)
  Factory.create(:tank)
  Factory.create(:dps)
  Factory.create(:healer)
end


Given /^"([^\"]*)" from "([^\"]*)" is a "([^\"]*)" character$/ do |character_name, realm_name, faction_name|
  @realm = Realm.find_by_name(realm_name) || Factory.create(:realm, :name => realm_name)
  @faction = Faction.find_by_name(faction_name) || Factory.create(:faction, :name => faction_name)
  @character = Character.find_by_name(character_name) || 
               Factory.create(:character, :name => character_name, :realm => @realm, :faction => @faction)
  #Should be stubbed out for the purposes of this feature, as it's not really the focus of the feature
  #@character.get_remote_xml
  #assert_match("Horde", @character.faction.name)
end

Given /^"([^\"]*)" is a tank$/ do |name|
  Factory.create(:character, :name => name, :roles => [Factory(:tank)])
end

Given /^"([^\"]*)" is dps$/ do |name|
  Factory.create(:character, :name => name, :roles => [Factory(:dps)])
end

Given /^"([^\"]*)" is a healer$/ do |name|
  Factory.create(:character, :name => name, :roles => [Factory(:healer)])
end

When /^I follow the "([^\"]*)" link for "([^\"]*)"$/ do |link, raid_title|
  r = Raid.find_by_title(raid_title)
  click_link("join_#{r.id}")
end

Given /^"([^\"]*)" is signed up for "([^\"]*)" as a "([^\"]*)"$/ do |name, title, role|
  raid = Raid.find_by_title(title)
  character = Character.find_by_name(name)
  role = Role.find_by_name(role)
  Factory.create(:sign_up, :raid => raid, :character => character, :role => role)
end


Given /^there is a raid entitled "([^\"]*)"$/ do |title|
  @raid = Factory.create(:raid, :title => title)
end

Given /^there is a raid entitled "([^\"]*)" on "([^\"]*)"$/ do |title, realm_name|
  realm = Realm.find_by_name(realm_name) || Factory.create(:realm, :name => realm_name)
  @raid = Factory(:raid, :title => title, :realm => realm)
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
