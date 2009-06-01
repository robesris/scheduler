require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe FactionsController do

  def mock_faction(stubs={})
    @mock_faction ||= mock_model(Faction, stubs)
  end
  
  describe "GET index" do
    it "assigns all factions as @factions" do
      Faction.stub!(:find).with(:all).and_return([mock_faction])
      get :index
      assigns[:factions].should == [mock_faction]
    end
  end

  describe "GET show" do
    it "assigns the requested faction as @faction" do
      Faction.stub!(:find).with("37").and_return(mock_faction)
      get :show, :id => "37"
      assigns[:faction].should equal(mock_faction)
    end
  end

  describe "GET new" do
    it "assigns a new faction as @faction" do
      Faction.stub!(:new).and_return(mock_faction)
      get :new
      assigns[:faction].should equal(mock_faction)
    end
  end

  describe "GET edit" do
    it "assigns the requested faction as @faction" do
      Faction.stub!(:find).with("37").and_return(mock_faction)
      get :edit, :id => "37"
      assigns[:faction].should equal(mock_faction)
    end
  end

  describe "POST create" do
    
    describe "with valid params" do
      it "assigns a newly created faction as @faction" do
        Faction.stub!(:new).with({'these' => 'params'}).and_return(mock_faction(:save => true))
        post :create, :faction => {:these => 'params'}
        assigns[:faction].should equal(mock_faction)
      end

      it "redirects to the created faction" do
        Faction.stub!(:new).and_return(mock_faction(:save => true))
        post :create, :faction => {}
        response.should redirect_to(faction_url(mock_faction))
      end
    end
    
    describe "with invalid params" do
      it "assigns a newly created but unsaved faction as @faction" do
        Faction.stub!(:new).with({'these' => 'params'}).and_return(mock_faction(:save => false))
        post :create, :faction => {:these => 'params'}
        assigns[:faction].should equal(mock_faction)
      end

      it "re-renders the 'new' template" do
        Faction.stub!(:new).and_return(mock_faction(:save => false))
        post :create, :faction => {}
        response.should render_template('new')
      end
    end
    
  end

  describe "PUT update" do
    
    describe "with valid params" do
      it "updates the requested faction" do
        Faction.should_receive(:find).with("37").and_return(mock_faction)
        mock_faction.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :faction => {:these => 'params'}
      end

      it "assigns the requested faction as @faction" do
        Faction.stub!(:find).and_return(mock_faction(:update_attributes => true))
        put :update, :id => "1"
        assigns[:faction].should equal(mock_faction)
      end

      it "redirects to the faction" do
        Faction.stub!(:find).and_return(mock_faction(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(faction_url(mock_faction))
      end
    end
    
    describe "with invalid params" do
      it "updates the requested faction" do
        Faction.should_receive(:find).with("37").and_return(mock_faction)
        mock_faction.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :faction => {:these => 'params'}
      end

      it "assigns the faction as @faction" do
        Faction.stub!(:find).and_return(mock_faction(:update_attributes => false))
        put :update, :id => "1"
        assigns[:faction].should equal(mock_faction)
      end

      it "re-renders the 'edit' template" do
        Faction.stub!(:find).and_return(mock_faction(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end
    
  end

  describe "DELETE destroy" do
    it "destroys the requested faction" do
      Faction.should_receive(:find).with("37").and_return(mock_faction)
      mock_faction.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "redirects to the factions list" do
      Faction.stub!(:find).and_return(mock_faction(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(factions_url)
    end
  end

end
