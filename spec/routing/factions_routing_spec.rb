require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe FactionsController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "factions", :action => "index").should == "/factions"
    end
  
    it "maps #new" do
      route_for(:controller => "factions", :action => "new").should == "/factions/new"
    end
  
    it "maps #show" do
      route_for(:controller => "factions", :action => "show", :id => "1").should == "/factions/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "factions", :action => "edit", :id => "1").should == "/factions/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "factions", :action => "create").should == {:path => "/factions", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "factions", :action => "update", :id => "1").should == {:path =>"/factions/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "factions", :action => "destroy", :id => "1").should == {:path =>"/factions/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/factions").should == {:controller => "factions", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/factions/new").should == {:controller => "factions", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/factions").should == {:controller => "factions", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/factions/1").should == {:controller => "factions", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/factions/1/edit").should == {:controller => "factions", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/factions/1").should == {:controller => "factions", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/factions/1").should == {:controller => "factions", :action => "destroy", :id => "1"}
    end
  end
end
