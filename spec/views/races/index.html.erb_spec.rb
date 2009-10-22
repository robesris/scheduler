require 'spec_helper'

describe "/races/index.html.erb" do
  include RacesHelper

  before(:each) do
    assigns[:races] = [
      stub_model(Race,
        :name => "value for name",
        :ability => "value for ability",
        :faction_id => 1
      ),
      stub_model(Race,
        :name => "value for name",
        :ability => "value for ability",
        :faction_id => 1
      )
    ]
  end

  it "renders a list of races" do
    render
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", "value for ability".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
  end
end
