# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

# Realms
gorefiend = Realm.create(:name => "Gorefiend")

# Factions
horde = Faction.create(:name => "Horde")
alliance = Faction.create(:name => "Alliance")

# Races
tauren = Race.create(:name => "Tauren", :faction => horde)

# Characters
rex = Character.create(:name => "Rexerengeti", :realm => gorefiend, :faction => horde)

# Roles
tank = Role.create(:name => "Tank")
dps = Role.create(:name => "DPS")
healer = Role.create(:name => "Healer")
