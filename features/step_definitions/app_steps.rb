Given /^"([^\"]*)" is a Horde character$/ do |character_name|
  @character = Character.create!(:name => character_name,
                                 :realm_id => Realm.find_by_name("Gorefiend").id)
  @character.get_remote_xml
  assert_match("Horde", @character.faction.name)
end

Then /^I can schedule a "([^\"]*)" run for "([^\"]*)"$/ do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end