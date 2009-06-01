require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/raids/show.html.erb" do
  include RaidsHelper
  before(:each) do
    assigns[:raid] = @raid = stub_model(Raid,
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
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/1/)
    response.should have_text(/value\ for\ code/)
    response.should have_text(/value\ for\ password/)
    response.should have_text(/false/)
    response.should have_text(/false/)
    response.should have_text(/1/)
    response.should have_text(/1/)
    response.should have_text(/1/)
    response.should have_text(/1/)
    response.should have_text(/1/)
  end
end

