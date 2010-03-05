require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Faction do
  before(:each) do
    @valid_attributes = {
      :name => "value for name"
    }
  end

  it "should create a new instance given valid attributes" do
    Faction.create!(@valid_attributes)
  end
end

# == Schema Information
#
# Table name: factions
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

