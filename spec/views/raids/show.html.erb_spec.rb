require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/raids/show.html.erb" do
  include RaidsHelper
  before(:each) do
    raid = Factory.create(:raid)
    sign_up = Factory.create(:sign_up, :raid_id => raid.id)
    assigns[:raid] = raid
  end

  it "renders attributes in <p>" do
    raid = assigns[:raid]
    render
    response.should have_text(/#{raid.code}/)
    response.should have_text(/#{raid.password}/)
    response.should have_text(/#{raid.title}/)
  end
  
  describe "with empty but optional values" do
    it "renders properly with a sign up with an empty role" do
      raid = Factory.create(:raid)
      sign_up_no_role = Factory.create(:sign_up, :role => nil, :raid => raid)
      assigns[:raid] = raid
      render
    end
  end
end

