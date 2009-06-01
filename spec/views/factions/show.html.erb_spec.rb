require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/factions/show.html.erb" do
  include FactionsHelper
  before(:each) do
    assigns[:faction] = @faction = stub_model(Faction,
      :name => "value for name"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ name/)
  end
end

