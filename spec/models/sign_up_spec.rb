require 'spec_helper'

describe SignUp do
  it "should allow a blank role" do
    sign_up = Factory.build(:sign_up, :role => nil)
    sign_up.should have(:no).errors_on(:role)
  end

  it "should create a new instance given valid attributes" do
    Factory(:sign_up)
  end
end
