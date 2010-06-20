require 'spec_helper'

describe "/sign_ups/new.html.erb" do
  include SignUpsHelper

  before(:each) do
    @raid = Factory.build(:raid,
      :code => Time.now.to_s,
      :password => "value for password",
      :searchable => false,
      :protected => false,
      :min_gear_level => 1,
      :tanks => 1,
      :heals => 1,
      :dps => 1
    )
    assigns[:raid] = @raid

    assigns[:sign_up] = SignUp.new
  end

  it "renders new sign_up form" do
    render

    response.should have_tag("form[action=?]", raid_sign_ups_path(@raid)) do
    end
  end
end
