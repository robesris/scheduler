require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/raids/index.html.erb" do
  include RaidsHelper
  
  before(:each) do
    assigns[:raids] = [
      stub_model(Raid,
        :instance_id => 1,
        :code => "value for code",
        :password => "value for password",
        :searchable => false,
        :protected => false,
        :creator_id => 1,
        :min_gear_level => 1,
        :tanks => 1,
        :heals => 1,
        :dps => 1
      ),
      stub_model(Raid,
        :instance_id => 1,
        :code => "value for code",
        :password => "value for password",
        :searchable => false,
        :protected => false,
        :creator_id => 1,
        :min_gear_level => 1,
        :tanks => 1,
        :heals => 1,
        :dps => 1
      )
    ]
  end

  it "renders a list of raids" do
    render
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", "value for code".to_s, 2)
    response.should have_tag("tr>td", "value for password".to_s, 2)
    response.should have_tag("tr>td", false.to_s, 2)
    response.should have_tag("tr>td", false.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
  end
end

