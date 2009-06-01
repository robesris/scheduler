require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Raid do
  def horde_faction(stubs={ :id => 1, :name => "Horde" })
    @horde_faction ||= mock_model(Faction, stubs)
  end
  
  def alliance_faction(stubs={ :id => 2, :name => "Alliance" })
    @alliance_faction ||= mock_model(Faction, stubs)
  end
  
  def mock_horde_character(stubs={ :id => 1, :faction_id => 1, :faction => horde_faction })
    @mock_horde_character ||= mock_model(Character, stubs)
  end
  
  def mock_alliance_character(stubs={ :id => 2, :faction_id => 2, :faction => alliance_faction })
    @mock_alliance_character ||= mock_model(Character, stubs)
  end
  
  before(:each) do
    @r = Raid.new
    
    now = Time.now
    @valid_attributes = {
      :instance_id => 1,
      :raid_time => now + 5.days,
      :raid_end_time => now + 5.days + 3.hours,
      :code => "1234abcd",
      :password => "mynewraid",
      :searchable => true,
      :protected => false,
      :creator_id => 1,
      :min_gear_level => 2000,
      :tanks => 2,
      :heals => 3,
      :dps => 5
    }
    
    @open_raid_attributes = {
      :instance_id => 1,
      :raid_time => now + 5.days,
      :searchable => true,
      :protected => false,
      :creator_id => 1,
      :min_gear_level => -1,
      :tanks => -1,
      :heals => -1,
      :dps => -1
    }
    
    @missing_required_attributes = {
      #:instance_id => 1,
      :raid_time => nil,
      :raid_end_time => now + 5.days + 3.hours,
      :code => "",
      :password => "mynewraid",
      :searchable => true,
      :protected => false,
      :creator_id => 1,
      :min_gear_level => 2000,
      :tanks => 2,
      :heals => 3,
      :dps => 5
    }
    
    @r.stub!(:creator).and_return(mock_horde_character)
  end

  it "should create a new instance given valid attributes" do
    @r.attributes = @valid_attributes
    @r.save
  end

  it "should check the presence of required fields" do
    @r.attributes = @missing_required_attributes
    @r.should have(1).error_on(:instance_id)
    @r.should have(1).error_on(:raid_time)
    @r.should have(1).error_on(:code)
  end
  
  it "should not allow an Alliance player to create a raid" do
    @r.stub!(:creator).and_return(mock_alliance_character)
    @r.should have(1).error_on(:creator_id)
  end
  
  it "should not allow an end time occurring at the same time or before the start time" do
    @r.attributes = @valid_attributes
    @r.raid_end_time = @r.raid_time - 3.hours
    @r.should have(1).error_on(:raid_end_time)
  end
  
  describe "raid signups" do
    it "should allow a Horde player to signup to a non-full, non-class-restricted raid" do
      @r.attributes = @open_raid_attributes
      @r.should_receive(:full?).and_return(false)
      @r.signup(@mock_horde_character)
    end
  end
end
