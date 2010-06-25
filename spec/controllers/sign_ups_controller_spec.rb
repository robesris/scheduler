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
    it "assigns all sign_ups for a raid as @sign_ups" do
      sign_up = Factory(:sign_up)
      SignUp.stub(:find_all_by_raid_id).with(sign_up.raid_id).and_return([sign_up])
      get :index, :raid_id => "#{sign_up.raid_id}"
      assigns[:sign_ups].should == [sign_up]
    end
  end

  describe "GET show" do
    it "assigns the requested sign_up as @sign_up" do
      sign_up = Factory(:sign_up)
      SignUp.stub(:find).with("#{sign_up.id}").and_return(sign_up)
      get :show, :id => "#{sign_up.id}", :raid_id => "#{sign_up.raid_id}"
      assigns[:sign_up].should equal(sign_up)
    end
  end

  describe "GET new" do
    it "assigns a new sign_up as @sign_up" do
      sign_up = Factory(:sign_up)
      SignUp.stub(:new).and_return(sign_up)
      get :new, :raid_id => "#{sign_up.raid_id}"
      assigns[:sign_up].should equal(sign_up)
    end
  end

  describe "GET edit" do
    it "assigns the requested sign_up as @sign_up" do
      sign_up = Factory(:sign_up)
      SignUp.stub(:find).with("#{sign_up.id}").and_return(sign_up)
      get :edit, :id => "#{sign_up.id}", :raid_id => "#{sign_up.raid_id}"
      assigns[:sign_up].should equal(sign_up)
    end
  end

  describe "POST create" do
   
    before(:each) do
      @realm = Factory.create(:realm)
      @character = Factory.create(:character, :realm_id => @realm.id)
      @raid = Factory.create(:raid, :realm_id => @realm.id)     
    end
    
    describe "with valid params" do
      
      
      it "assigns a newly created sign_up as @sign_up" do
        post :create, :raid_id => @raid.id, :character_name => @character.name, :realm_name => @realm.name
        assigns[:sign_up].raid.should == @raid
        assigns[:sign_up].character.should == @character
      end

      it "redirects to the raid" do
        sign_up = Factory(:sign_up)
        SignUp.stub(:new).and_return(sign_up)
        post :create, :raid_id => @raid.id, :character_name => @character.name, :realm_name => @realm.name
        response.should redirect_to(raid_path(sign_up.raid))
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
        post :create, :raid_id => -1, :character_name => @character.name
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested sign_up" do
        sign_up = Factory(:sign_up)
        SignUp.should_receive(:find).with("#{sign_up.id}").and_return(sign_up)
        sign_up.should_receive(:update_attributes).with({'raid_id' => '100'})
        put :update, :id => "#{sign_up.id}", :raid_id => "#{sign_up.raid_id}", :sign_up => {:raid_id => '100'}
      end

      it "assigns the requested sign_up as @sign_up" do
        sign_up = Factory(:sign_up)
        SignUp.stub(:find).and_return(sign_up)
        put :update, :id => "#{sign_up.id}", :raid_id => "#{sign_up.raid_id}"
        assigns[:sign_up].should equal(sign_up)
      end

      it "redirects to the sign_up" do
        sign_up = Factory(:sign_up)
        SignUp.stub(:find).and_return(sign_up)
        put :update, :id => "#{sign_up.id}", :raid_id => "#{sign_up.raid_id}"
        response.should redirect_to(raid_sign_up_url(sign_up.raid, sign_up))
      end
    end



  end

  describe "DELETE destroy" do
    it "destroys the requested sign_up" do
      sign_up = Factory.create(:sign_up)
      SignUp.stub(:find).and_return(sign_up)
      SignUp.should_receive(:find).with(sign_up.id.to_s).and_return(sign_up)
      sign_up.should_receive(:raid)
      sign_up.should_receive(:destroy)
      delete :destroy, :id => sign_up.id, :raid_id => sign_up.raid_id
    end

    it "redirects to the sign_ups list" do
      sign_up = Factory.create(:sign_up)
      SignUp.stub(:find).and_return(sign_up)
      delete :destroy, :id => "#{sign_up.id}", :raid_id => "#{sign_up.raid_id}"
      response.should redirect_to(raid_sign_ups_url(sign_up.raid))
    end
  end

end
