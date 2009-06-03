require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/characters/new.html.erb" do
  include CharactersHelper
  
  before(:each) do
    assigns[:character] = stub_model(Character,
      :new_record? => true
    )
  end

  it "renders new character form" do
    render
    
    response.should have_tag("form[action=?][method=post]", characters_path) do
    end
  end
end


