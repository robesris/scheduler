require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/factions/edit.html.erb" do
  include FactionsHelper
  
  before(:each) do
    assigns[:faction] = @faction = stub_model(Faction,
      :new_record? => false,
      :name => "value for name"
    )
  end

  it "renders the edit faction form" do
    render
    
    response.should have_tag("form[action=#{faction_path(@faction)}][method=post]") do
      with_tag('input#faction_name[name=?]', "faction[name]")
    end
  end
end


