Given /^"([^\"]*)" from "([^\"]*)" is a Horde character$/ do |character_name, realm_name|
  @character = Character.create!(:name => character_name,
                                 :realm_id => Realm.find_by_name(realm_name).id)
  @character.get_remote_xml
  assert_match("Horde", @character.faction.name)
end
