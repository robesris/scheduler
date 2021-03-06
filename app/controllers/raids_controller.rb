class RaidsController < ApplicationController
  
  # PUT /raids/1/sign_up
  # def sign_up
  #   @raid = Raid.find(params[:id])
  #   @sign_up = SignUp.new(:raid => @raid)
  # end
  
  # GET /raids
  # GET /raids.xml
  def index
    @raids = Raid.find_all_by_searchable(true)
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @raids }
    end
  end

  # GET /raids/1
  # GET /raids/1.xml
  def show
    @raid = Raid.find_by_code(params[:code])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @raid }
    end
  end

  # GET /raids/new
  # GET /raids/new.xml
  def new
    @raid = Raid.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @raid }
    end
  end

  # GET /raids/1/edit
  def edit
    @raid = Raid.find(params[:id])
  end

  # POST /raids
  # POST /raids.xml
  def create
    creator = Character.fetch(:name => params[:creator_name])
    creator_id = creator && creator.id
    @raid = Raid.new(params[:raid].merge(:creator_id => creator_id))

    respond_to do |format|
      if @raid.save
        flash[:notice] = 'Raid created successfully!'
        format.html { redirect_to(raid_url(@raid.code)) }
        format.xml  { render :xml => @raid, :status => :created, :location => @raid }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @raid.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /raids/1
  # PUT /raids/1.xml
  def update
    @raid = Raid.find(params[:id])

    respond_to do |format|
      if @raid.update_attributes(params[:raid])
        flash[:notice] = 'Raid was successfully updated.'
        format.html { redirect_to(@raid) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @raid.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /raids/1
  # DELETE /raids/1.xml
  def destroy
    @raid = Raid.find(params[:id])
    @raid.destroy

    respond_to do |format|
      format.html { redirect_to(raids_url) }
      format.xml  { head :ok }
    end
  end
end
