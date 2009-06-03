require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/characters/index.html.erb" do
  include CharactersHelper
  
  before(:each) do
    assigns[:characters] = [
      stub_model(Character),
      stub_model(Character)
    ]
  end

  it "renders a list of characters" do
    render
  end
end

