require 'spec_helper'

describe "/races/edit.html.erb" do
  include RacesHelper

  before(:each) do
    assigns[:race] = @race = stub_model(Race,
      :new_record? => false,
      :name => "value for name",
      :ability => "value for ability",
      :faction_id => 1
    )
  end

  it "renders the edit race form" do
    render

    response.should have_tag("form[action=#{race_path(@race)}][method=post]") do
      with_tag('input#race_name[name=?]', "race[name]")
      with_tag('input#race_ability[name=?]', "race[ability]")
      with_tag('input#race_faction_id[name=?]', "race[faction_id]")
    end
  end
end
