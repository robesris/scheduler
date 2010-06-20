require 'spec_helper'

describe SignUpsController do
  describe "routing" do
    before(:each) do
      @sign_up = Factory.create(:sign_up)
      @raid_id = @sign_up.raid.id
    end
    
    it "recognizes and generates #index" do
      { :get => "/raids/#{@raid_id}/sign_ups" }.should route_to(:controller => "sign_ups", :action => "index", :raid_id => @raid_id.to_s)
    end

    it "recognizes and generates #new" do
      { :get => "/raids/#{@raid_id}/sign_ups/new" }.should route_to(:controller => "sign_ups", :action => "new", :raid_id => @raid_id.to_s)
    end

    it "recognizes and generates #show" do
      { :get => "/raids/#{@raid_id}/sign_ups/1" }.should route_to(:controller => "sign_ups", :action => "show", :id => "1", :raid_id => @raid_id.to_s)
    end

    it "recognizes and generates #edit" do
      { :get => "/raids/#{@raid_id}/sign_ups/1/edit" }.should route_to(:controller => "sign_ups", :action => "edit", :id => "1", :raid_id => @raid_id.to_s)
    end

    it "recognizes and generates #create" do
      { :post => "/raids/#{@raid_id}/sign_ups" }.should route_to(:controller => "sign_ups", :action => "create", :raid_id => @raid_id.to_s) 
    end

    it "recognizes and generates #update" do
      { :put => "/raids/#{@raid_id}/sign_ups/1" }.should route_to(:controller => "sign_ups", :action => "update", :id => "1", :raid_id => @raid_id.to_s) 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/raids/#{@raid_id}/sign_ups/1" }.should route_to(:controller => "sign_ups", :action => "destroy", :id => "1", :raid_id => @raid_id.to_s) 
    end
  end
end
