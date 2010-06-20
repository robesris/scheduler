require 'spec_helper'

describe "/sign_ups/edit.html.erb" do
  include SignUpsHelper

  before(:each) do
    @sign_up = Factory.create(:sign_up)
    assigns[:sign_up] = @sign_up
    assigns[:raid] = @sign_up.raid
  end

  it "renders the edit sign_up form" do
    render

    response.should have_tag("form[action=?][method=post]", raid_sign_up_path(@sign_up.raid, @sign_up)) do
    end
  end
end
