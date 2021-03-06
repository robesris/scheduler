require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe RaidsController do
  
  def mock_raid(stubs={})
    @mock_raid ||= mock_model(Raid, stubs)
  end
  
  def factory_raid
    @factory_raid ||= Factory.create(:raid)
  end
  
  describe "GET index" do
    before :each do
      @searchable_1 = Factory(:raid, :searchable => true)
      @searchable_2 = Factory(:raid, :searchable => true)
      @unsearchable = Factory(:raid, :searchable => false) 
    end
    
    it "assigns all raids as @raids" do
      Raid.stub(:find_all_by_searchable).and_return(@searchable_1)
      get :index
      assigns[:raids].should == @searchable_1
    end
    
    it "should only find searchable raids" do
      get :index
      assigns[:raids].should include(@searchable_1)
      assigns[:raids].should include(@searchable_2)
      assigns[:raids].should_not include(@unsearchable)
    end
  end

  describe "GET show" do
    it "assigns the requested raid as @raid" do
      Raid.stub!(:find_by_code).with("myraid37").and_return(mock_raid)
      get :show, :code => "myraid37"
      assigns[:raid].should equal(mock_raid)
    end
  end

  describe "GET new" do
    it "assigns a new raid as @raid" do
      Raid.stub!(:new).and_return(mock_raid)
      get :new
      assigns[:raid].should equal(mock_raid)
    end
  end

  describe "GET edit" do
    it "assigns the requested raid as @raid" do
      Raid.stub!(:find).with("37").and_return(mock_raid)
      get :edit, :id => "37"
      assigns[:raid].should equal(mock_raid)
    end
  end

  describe "POST create" do
    
    describe "with valid params" do
      it "assigns a newly created raid as @raid" do
        new_raid = Factory.build(:raid)
        Raid.stub!(:new).and_return(new_raid)
        post :create, :raid => new_raid.attributes
        assigns[:raid].should equal(new_raid)
      end

      it "redirects to the created raid" do
        new_raid = Factory(:raid)
        Raid.stub!(:new).and_return(new_raid)
        post :create, :raid => { :code => new_raid.code }
        response.should redirect_to(raid_url(new_raid.code))
      end
    end
    
    describe "with invalid params" do
      it "assigns a newly created but unsaved raid as @raid" do
        Raid.stub!(:new).and_return(mock_raid(:save => false))
        Character.stub!(:find).and_return(Factory(:character))
        post :create, :raid => {:these => 'params'}
        assigns[:raid].should equal(mock_raid)
      end

      it "re-renders the 'new' template" do
        Raid.stub!(:new).and_return(mock_raid(:save => false))
        post :create, :raid => {}
        response.should render_template('new')
      end
    end
    
    describe "validate the raid creator" do
      before :each do
        @c = Factory.create(:horde_character)
        @r = Factory.build(:raid)
        @raid_attribs = @r.attributes
        @raid_attribs['creator_id'] = nil
        @raid_attribs['realm_id'] = @c.realm_id
      end
      
      it "redirects to the newly created raid for a valid creator" do
        post :create, :creator_name => @c.name, :raid => @raid_attribs
        created_raid = Raid.find_by_code(@r.code)
        response.should redirect_to(raid_url(created_raid.code))
      end
      
      it "re-renders the new template for an invalid creator" do
        post :create, :creator_name => @c.name + "bad", :raid => @raid_attribs
        response.should render_template('new')
      end
    end  
    
  end   

  describe "PUT update" do
    
    describe "with valid params" do
      it "updates the requested raid" do
        Raid.should_receive(:find).with("37").and_return(mock_raid)
        mock_raid.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :raid => {:these => 'params'}
      end

      it "assigns the requested raid as @raid" do
        Raid.stub!(:find).and_return(mock_raid(:update_attributes => true))
        put :update, :id => "1"
        assigns[:raid].should equal(mock_raid)
      end

      it "redirects to the raid" do
        Raid.stub!(:find).and_return(mock_raid(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(raid_url(mock_raid))
      end
    end
    
    describe "with invalid params" do
      it "updates the requested raid" do
        Raid.should_receive(:find).with("37").and_return(mock_raid)
        mock_raid.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :raid => {:these => 'params'}
      end

      it "assigns the raid as @raid" do
        Raid.stub!(:find).and_return(mock_raid(:update_attributes => false))
        put :update, :id => "1"
        assigns[:raid].should equal(mock_raid)
      end

      it "re-renders the 'edit' template" do
        Raid.stub!(:find).and_return(mock_raid(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end
    
  end

  describe "DELETE destroy" do
    it "destroys the requested raid" do
      Raid.should_receive(:find).with("37").and_return(mock_raid)
      mock_raid.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "redirects to the raids list" do
      Raid.stub!(:find).and_return(mock_raid(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(raids_url)
    end
  end

end
