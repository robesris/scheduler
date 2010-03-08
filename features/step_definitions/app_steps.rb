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
