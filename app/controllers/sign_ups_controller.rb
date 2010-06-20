class SignUpsController < ApplicationController
  # GET /sign_ups
  # GET /sign_ups.xml
  def index
    @sign_ups = SignUp.find_all_by_raid_id(params[:raid_id])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @sign_ups }
    end
  end

  # GET /sign_ups/1
  # GET /sign_ups/1.xml
  def show
    @sign_up = SignUp.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @sign_up }
    end
  end

  # GET /sign_ups/new
  # GET /sign_ups/new.xml
  def new
    @raid = Raid.find(params[:raid_id])
    @sign_up = SignUp.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @sign_up }
    end
  end

  # GET /sign_ups/1/edit
  def edit
    #@raid = Raid.find(params[:raid_id])
    @sign_up = SignUp.find(params[:id])
    
    #render edit_raid_sign_up_path(@raid, @sign_up)
  end

  # POST /sign_ups
  # POST /sign_ups.xml
  def create
    @sign_up = SignUp.new
    @sign_up.raid = Raid.find_by_id(params[:raid_id])   # using this format instead of Raid.find, which throws an AR error if not found
    realm = Realm.find_by_name(params[:realm_name])
    #raise params[:character_name].inspect + " **** " + realm.inspect

    @sign_up.character = Character.find_by_name(params[:character_name])
    respond_to do |format|
      if @sign_up.save
        flash[:notice] = 'You successfully signed up for the raid!'
        format.html { redirect_to(@sign_up.raid) }
        format.xml  { render :xml => @sign_up, :status => :created, :location => @sign_up }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @sign_up.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /sign_ups/1
  # PUT /sign_ups/1.xml
  def update
    @sign_up = SignUp.find(params[:id])
    @raid = Raid.find(params[:raid_id])

    respond_to do |format|
      if @sign_up.update_attributes(params[:sign_up])
        flash[:notice] = 'SignUp was successfully updated.'
        format.html { redirect_to(raid_sign_up_path(@raid, @sign_up)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @sign_up.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /sign_ups/1
  # DELETE /sign_ups/1.xml
  def destroy
    @sign_up = SignUp.find(params[:id])
    @raid = @sign_up.raid
    @sign_up.destroy

    respond_to do |format|
      format.html { redirect_to(raid_sign_ups_path(@raid), :method => :get) }
      format.xml  { head :ok }
    end
  end
end
