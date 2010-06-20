require 'spec_helper'

describe SignUp do
  before(:each) do
    @character = Factory(:character)
    @raid = Factory(:raid)
    @role = Factory(:role)
    @valid_attributes = {
      :character_id => @character.id,
      :raid_id => @raid.id,
      :role_id => @role.id
    }
  end

  it "should create a new instance given valid attributes" do
    SignUp.create!(@valid_attributes)
  end
end
