require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Character do
  before(:all) do
    race = Race.new(:name => "Tauren")
    race.save!
    faction = Faction.new(:name => "Horde")
    faction.save!
    realm = Realm.new(:name => "Gorefiend")
    realm.save!
  end
  
  before(:each) do
    @valid_attributes = {
    }
  end

  it "should create a new instance given valid attributes" do
    Character.create!(@valid_attributes)
  end
  
  it "should get character info from the WoW armory site as XML" do
    c = Character.new
    c.name = "Rexerengeti"
    c.realm = Realm.new
    c.realm.name = "Gorefiend"
    c.get_remote_xml
    c.race.name.should == "Tauren"
    c.faction.name.should == "Horde"
    c.realm.name.should == "Gorefiend"
  end
end

# == Schema Information
#
# Table name: characters
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  faction_id :integer
#  race_id    :integer
#  class_id   :integer
#  level      :integer
#  gear_score :integer
#  created_at :datetime
#  updated_at :datetime
#  realm_id   :integer
#

