require 'spec_helper'

describe Race do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :ability => "value for ability",
      :faction_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Race.create!(@valid_attributes)
  end
end
