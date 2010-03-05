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

