require 'spec_helper'

describe Race do
  before(:each) do

  end

  it "should have a faction" do
    race = Factory.build(:race, :faction => nil)
    race.should have(1).error_on(:faction)
  end
  
  it "should have a name" do
    race = Factory.build(:race, :name => "")
    race.should have(1).error_on(:name)
    
    race = Factory.build(:race, :name => nil)
    race.should have(1).error_on(:name)
  end

  it "should create a new instance given valid attributes" do
    Factory(:race)
  end
end

# == Schema Information
#
# Table name: races
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  ability    :string(255)
#  faction_id :integer
#  created_at :datetime
#  updated_at :datetime
#

