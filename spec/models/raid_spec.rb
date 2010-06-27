require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Raid do
  
  before(:each) do
    @r = Factory(:raid)
    
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
      :raid_time => DateTime.now + 5.days,
      :searchable => true,
      :protected => false,
      :creator_id => 1,
      :min_gear_level => -1,
      :tanks => -1,
      :heals => -1,
      :dps => -1
    }
    
    @missing_required_attributes = {
      :instance_id => nil,
      :raid_time => nil,
      :raid_end_time => now + 5.days + 3.hours,
      :code => "",
      :password => "mynewraid",
      :searchable => true,
      :protected => false,
      :creator_id => nil,
      :min_gear_level => 2000,
      :tanks => 2,
      :heals => 3,
      :dps => 5
    }
    
    @horde_character = Factory(:horde_character)
    @r.stub!(:creator).and_return(@horde_character)
  end

  it "should create a new instance given valid attributes" do
    @r.attributes = @valid_attributes
    @r.save
  end

  it "should check the presence of required fields" do
    @r.attributes = @missing_required_attributes
    @r.should have(1).error_on(:instance_id)
    @r.should have(1).error_on(:raid_time)
    @r.should have(3).errors_on(:code)
    @r.should have(1).error_on(:creator_id)
  end
  
  it "should only allow alphanumeric characters in the code" do
    @r.code = "ABC123"
    @r.should have(0).errors_on(:code)
    
    @r.code = "123ABC1A"
    @r.should have(0).errors_on(:code)
    
    @r.code = "A"
    @r.should have(0).errors_on(:code)
    
    @r.code = "ABC 123"
    @r.should have(1).error_on(:code)
    
    @r.code = "ABC !23"
    @r.should have(1).error_on(:code)
    
    @r.code = "ABC_123"
    @r.should have(1).error_on(:code)
    
    @r.code = nil
    @r.should have_at_least(1).error_on(:code)
    
    @r.code = ""
    @r.should have_at_least(1).error_on(:code)
  end
  
  it "should not allow duplicate codes" do
    first_raid = Factory.create(:raid, :code => "ABCDEFG")
    second_raid = Factory.build(:raid, :code => "ABCDEFG")
    lambda {
      second_raid.save!
    }.should raise_exception
  end
  
  it "should only allow codes from 1 to 20 characters in length" do
    @r.code = "12345678901234567890"
    @r.should have(0).errors_on(:code)
    
    @r.code = ""
    @r.should have_at_least(1).error_on(:code)
    
    @r.code = "12345678901234567890A"
    @r.should have(1).error_on(:code)
  end
  
  it "should allow a Horde player to create a raid" do
    @r.stub!(:creator).and_return(Factory(:character, :faction => Factory(:horde)))
    @r.should have(0).errors_on(:creator_id)
  end
  
  it "should not allow an Alliance player to create a raid" do
    @r.stub!(:creator).and_return(Factory(:character, :faction => Factory(:alliance)))
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
      Character.should_receive(:find_by_name).
                with(@horde_character.name).
                and_return(@horde_character)
      @r.should_receive(:full?).and_return(false)
      lambda {
        @r.signup(@horde_character.name, Factory(:role).name)
      }.should change(@r.characters, :size).by(1)
    end
  end
end

# == Schema Information
#
# Table name: raids
#
#  id             :integer         not null, primary key
#  instance_id    :integer
#  raid_time      :datetime
#  code           :string(255)
#  password       :string(255)
#  searchable     :boolean
#  protected      :boolean
#  creator_id     :integer
#  min_gear_level :integer
#  tanks          :integer
#  heals          :integer
#  dps            :integer
#  created_at     :datetime
#  updated_at     :datetime
#  raid_end_time  :datetime
#  realm_id       :integer
#

