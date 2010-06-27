require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe RaidsController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "raids", :action => "index").should == "/raids"
    end
  
    it "maps #new" do
      route_for(:controller => "raids", :action => "new").should == "/raids/new"
    end
  
    it "maps #show" do
      route_for(:controller => "raids", :action => "show", :code => "1A1A1A").should == "/raids/view/1A1A1A"
    end
  
    it "maps #edit" do
      route_for(:controller => "raids", :action => "edit", :id => "1").should == "/raids/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "raids", :action => "create").should == {:path => "/raids", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "raids", :action => "update", :id => "1").should == {:path =>"/raids/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "raids", :action => "destroy", :id => "1").should == {:path =>"/raids/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/raids").should == {:controller => "raids", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/raids/new").should == {:controller => "raids", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/raids").should == {:controller => "raids", :action => "create"}
    end
  
    it "generates params for #show" do
      { :get => "/raids/1"}.should_not be_routable
      { :get => "/raids/view/1"}.should route_to(:controller => "raids", :action => "show", :code => "1")
      { :get => "/raids/view/ABCD1234"}.should route_to(:controller => "raids", :action => "show", :code => "ABCD1234")
    end
  
    it "generates params for #edit" do
      params_from(:get, "/raids/1/edit").should == {:controller => "raids", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/raids/1").should == {:controller => "raids", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/raids/1").should == {:controller => "raids", :action => "destroy", :id => "1"}
    end
  end
end
