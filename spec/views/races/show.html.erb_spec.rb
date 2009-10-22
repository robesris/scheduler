require 'spec_helper'

describe "/races/show.html.erb" do
  include RacesHelper
  before(:each) do
    assigns[:race] = @race = stub_model(Race,
      :name => "value for name",
      :ability => "value for ability",
      :faction_id => 1
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ name/)
    response.should have_text(/value\ for\ ability/)
    response.should have_text(/1/)
  end
end
