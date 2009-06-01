require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Raid do
  def mock_alliance_character(stubs={ :id => 1, :faction_id => 2 })
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
    
  end

  it "should create a new instance given valid attributes" do
    Raid.create!(@valid_attributes)
  end

  it "should check the presence of required fields" do
    @r.attributes = @missing_required_attributes
    @r.should have(1).error_on(:instance_id)
    @r.should have(1).error_on(:raid_time)
    @r.should have(1).error_on(:code)
  end
  
  it "should not allow an Alliance player to create a raid" do
    @r.stub!(:creator).and_return(mock_character)
    @r.creator
end
