require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/raids/edit.html.erb" do
  include RaidsHelper
  
  before(:each) do
    assigns[:raid] = @raid = stub_model(Raid,
      :new_record? => false,
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

  it "renders the edit raid form" do
    render
    
    response.should have_tag("form[action=#{raid_path(@raid)}][method=post]") do
      with_tag('input#raid_instance_id[name=?]', "raid[instance_id]")
      with_tag('input#raid_code[name=?]', "raid[code]")
      with_tag('input#raid_password[name=?]', "raid[password]")
      with_tag('input#raid_searchable[name=?]', "raid[searchable]")
      with_tag('input#raid_protected[name=?]', "raid[protected]")
      with_tag('input#raid_creator_id[name=?]', "raid[creator_id]")
      with_tag('input#raid_min_gear_level[name=?]', "raid[min_gear_level]")
      with_tag('input#raid_tanks[name=?]', "raid[tanks]")
      with_tag('input#raid_heals[name=?]', "raid[heals]")
      with_tag('input#raid_dps[name=?]', "raid[dps]")
    end
  end
end


