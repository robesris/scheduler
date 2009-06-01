require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/factions/new.html.erb" do
  include FactionsHelper
  
  before(:each) do
    assigns[:faction] = stub_model(Faction,
      :new_record? => true,
      :name => "value for name"
    )
  end

  it "renders new faction form" do
    render
    
    response.should have_tag("form[action=?][method=post]", factions_path) do
      with_tag("input#faction_name[name=?]", "faction[name]")
    end
  end
end


