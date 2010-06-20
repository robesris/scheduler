require 'spec_helper'

describe SignUpsController do
  # Really shouldn't be using Factories and mock_models but for now, just trying to get everything green
  before(:each) do
    #@sign_up = Factory.build(:sign_up)
  end
  
  def mock_sign_up(stubs={})
    @mock_sign_up ||= mock_model(SignUp, stubs)
  end

  describe "GET index" do
    it "assigns all sign_ups as @sign_ups" do
      SignUp.stub(:find).with(:all).and_return([mock_sign_up])
      get :index
      assigns[:sign_ups].should == [mock_sign_up]
    end
  end

  describe "GET show" do
    it "assigns the requested sign_up as @sign_up" do
      SignUp.stub(:find).with("37").and_return(mock_sign_up)
      get :show, :id => "37"
      assigns[:sign_up].should equal(mock_sign_up)
    end
  end

  describe "GET new" do
    it "assigns a new sign_up as @sign_up" do
      SignUp.stub(:new).and_return(mock_sign_up)
      get :new, :raid_id => "1"
      assigns[:sign_up].should equal(mock_sign_up)
    end
  end

  describe "GET edit" do
    it "assigns the requested sign_up as @sign_up" do
      SignUp.stub(:find).with("37").and_return(mock_sign_up)
      get :edit, :id => "37"
      assigns[:sign_up].should equal(mock_sign_up)
    end
  end

  describe "POST create" do
   
    before(:each) do
      @character = Factory.create(:character)
      @realm = Factory.create(:realm)
      @raid = Factory.create(:raid)
      
    end
    
    describe "with valid params" do
      
      
      it "assigns a newly created sign_up as @sign_up" do
        #SignUp.stub(:new).with({'these' => 'params'}).and_return(mock_sign_up(:save => true))
        #mock_sign_up.should_receive(:raid)
        #mock_sign_up.should_receive(:raid=)
        #mock_sign_up.should_receive(:character=)
        post :create, :raid_id => @raid.id, :character_name => @character.name, :realm_name => @realm.name
        assigns[:sign_up].raid.should == @raid
        assigns[:sign_up].character.should == @character
        assigns[:sign_up].realm.should == @realm
      end

      it "redirects to the created sign_up" do
        #SignUp.stub(:new).and_return(mock_sign_up(:save => true))
        #mock_sign_up.should_receive(:raid)
        #mock_sign_up.should_receive(:raid=)
        #mock_sign_up.should_receive(:character=)
        post :create, :raid_id => "1", :sign_up => { :raid_id => "1"}
        response.should redirect_to(sign_up_url(mock_sign_up))
      end
    end

    describe "with invalid params" do
      # This is probably not necessary to test
      #
      # it "assigns a newly created but unsaved sign_up as @sign_up" do
      #   # SignUp.stub(:new).with({'these' => 'params'}).and_return(mock_sign_up(:save => false))
      #   # mock_sign_up.should_receive(:raid=)
      #   # mock_sign_up.should_receive(:character=)
      #   post :create, :raid_id => "0", :sign_up => {:these => 'params'}
      #   assigns[:sign_up].raid_id.should equal(0)
      # end

      it "re-renders the 'new' template" do
        # SignUp.stub(:new).and_return(mock_sign_up(:save => false))
        # mock_sign_up.should_receive(:raid=)
        # mock_sign_up.should_receive(:character=)
        post :create, :raid_id => @raid.id, :sign_up => { :character_name => @character.name, :realm_name => @realm.name }
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested sign_up" do
        SignUp.should_receive(:find).with("37").and_return(mock_sign_up)
        mock_sign_up.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :raid_id => "1", :sign_up => {:these => 'params'}
      end

      it "assigns the requested sign_up as @sign_up" do
        SignUp.stub(:find).and_return(mock_sign_up(:update_attributes => true))
        put :update, :id => "1", :raid_id => "1"
        assigns[:sign_up].should equal(mock_sign_up)
      end

      it "redirects to the sign_up" do
        SignUp.stub(:find).and_return(mock_sign_up(:update_attributes => true))
        SignUp.stub(:raid).and_return(mock_model(Raid))
        put :update, :id => "1", :raid_id => "1"
        response.should redirect_to(raid_sign_up_url(1, mock_sign_up))
      end
    end

    describe "with invalid params" do
      it "updates the requested sign_up" do
        SignUp.should_receive(:find).with("37").and_return(mock_sign_up)
        mock_sign_up.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :raid_id => 1, :sign_up => {:these => 'params'}
      end

      it "assigns the sign_up as @sign_up" do
        SignUp.stub(:find).and_return(mock_sign_up(:update_attributes => false))
        put :update, :id => "1", :raid_id => "1"
        assigns[:sign_up].should equal(mock_sign_up)
      end

      it "re-renders the 'edit' template" do
        SignUp.stub(:find).and_return(mock_sign_up(:update_attributes => false))
        put :update, :id => "1", :raid_id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested sign_up" do
      SignUp.stub(:find).and_return(mock_sign_up)
      SignUp.should_receive(:find).with("37").and_return(mock_sign_up)
      mock_sign_up.should_receive(:raid)
      mock_sign_up.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the sign_ups list" do
      SignUp.stub(:find).and_return(mock_sign_up(:destroy => true))
      mock_sign_up.should_receive(:raid).at_least(1).times
      delete :destroy, :id => "1"
      response.should redirect_to(raid_sign_ups_url(mock_sign_up.raid))
    end
  end

end
