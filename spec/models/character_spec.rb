require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Character do
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
    c.race.should == "Tauren"
  end
end
