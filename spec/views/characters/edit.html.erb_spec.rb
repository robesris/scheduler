require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/characters/edit.html.erb" do
  include CharactersHelper
  
  before(:each) do
    assigns[:character] = @character = stub_model(Character,
      :new_record? => false
    )
  end

  it "renders the edit character form" do
    render
    
    response.should have_tag("form[action=#{character_path(@character)}][method=post]") do
    end
  end
end


