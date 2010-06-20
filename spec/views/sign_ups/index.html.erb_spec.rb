require 'spec_helper'

describe "/sign_ups/index.html.erb" do
  include SignUpsHelper

  before(:each) do
    assigns[:raid] = Factory.create(:raid)
    
    assigns[:sign_ups] = [
      stub_model(SignUp),
      stub_model(SignUp)
    ]
  end

  it "renders a list of sign_ups" do
    render :template => 'sign_ups/index'
  end
end
