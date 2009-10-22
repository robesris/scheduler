require 'spec_helper'

describe RacesController do

  def mock_race(stubs={})
    @mock_race ||= mock_model(Race, stubs)
  end

  describe "GET index" do
    it "assigns all races as @races" do
      Race.stub!(:find).with(:all).and_return([mock_race])
      get :index
      assigns[:races].should == [mock_race]
    end
  end

  describe "GET show" do
    it "assigns the requested race as @race" do
      Race.stub!(:find).with("37").and_return(mock_race)
      get :show, :id => "37"
      assigns[:race].should equal(mock_race)
    end
  end

  describe "GET new" do
    it "assigns a new race as @race" do
      Race.stub!(:new).and_return(mock_race)
      get :new
      assigns[:race].should equal(mock_race)
    end
  end

  describe "GET edit" do
    it "assigns the requested race as @race" do
      Race.stub!(:find).with("37").and_return(mock_race)
      get :edit, :id => "37"
      assigns[:race].should equal(mock_race)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created race as @race" do
        Race.stub!(:new).with({'these' => 'params'}).and_return(mock_race(:save => true))
        post :create, :race => {:these => 'params'}
        assigns[:race].should equal(mock_race)
      end

      it "redirects to the created race" do
        Race.stub!(:new).and_return(mock_race(:save => true))
        post :create, :race => {}
        response.should redirect_to(race_url(mock_race))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved race as @race" do
        Race.stub!(:new).with({'these' => 'params'}).and_return(mock_race(:save => false))
        post :create, :race => {:these => 'params'}
        assigns[:race].should equal(mock_race)
      end

      it "re-renders the 'new' template" do
        Race.stub!(:new).and_return(mock_race(:save => false))
        post :create, :race => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested race" do
        Race.should_receive(:find).with("37").and_return(mock_race)
        mock_race.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :race => {:these => 'params'}
      end

      it "assigns the requested race as @race" do
        Race.stub!(:find).and_return(mock_race(:update_attributes => true))
        put :update, :id => "1"
        assigns[:race].should equal(mock_race)
      end

      it "redirects to the race" do
        Race.stub!(:find).and_return(mock_race(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(race_url(mock_race))
      end
    end

    describe "with invalid params" do
      it "updates the requested race" do
        Race.should_receive(:find).with("37").and_return(mock_race)
        mock_race.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :race => {:these => 'params'}
      end

      it "assigns the race as @race" do
        Race.stub!(:find).and_return(mock_race(:update_attributes => false))
        put :update, :id => "1"
        assigns[:race].should equal(mock_race)
      end

      it "re-renders the 'edit' template" do
        Race.stub!(:find).and_return(mock_race(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested race" do
      Race.should_receive(:find).with("37").and_return(mock_race)
      mock_race.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the races list" do
      Race.stub!(:find).and_return(mock_race(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(races_url)
    end
  end

end
