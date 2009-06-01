require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/factions/index.html.erb" do
  include FactionsHelper
  
  before(:each) do
    assigns[:factions] = [
      stub_model(Faction,
        :name => "value for name"
      ),
      stub_model(Faction,
        :name => "value for name"
      )
    ]
  end

  it "renders a list of factions" do
    render
    response.should have_tag("tr>td", "value for name".to_s, 2)
  end
end

