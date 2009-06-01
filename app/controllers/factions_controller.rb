class FactionsController < ApplicationController
  # GET /factions
  # GET /factions.xml
  def index
    @factions = Faction.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @factions }
    end
  end

  # GET /factions/1
  # GET /factions/1.xml
  def show
    @faction = Faction.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @faction }
    end
  end

  # GET /factions/new
  # GET /factions/new.xml
  def new
    @faction = Faction.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @faction }
    end
  end

  # GET /factions/1/edit
  def edit
    @faction = Faction.find(params[:id])
  end

  # POST /factions
  # POST /factions.xml
  def create
    @faction = Faction.new(params[:faction])

    respond_to do |format|
      if @faction.save
        flash[:notice] = 'Faction was successfully created.'
        format.html { redirect_to(@faction) }
        format.xml  { render :xml => @faction, :status => :created, :location => @faction }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @faction.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /factions/1
  # PUT /factions/1.xml
  def update
    @faction = Faction.find(params[:id])

    respond_to do |format|
      if @faction.update_attributes(params[:faction])
        flash[:notice] = 'Faction was successfully updated.'
        format.html { redirect_to(@faction) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @faction.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /factions/1
  # DELETE /factions/1.xml
  def destroy
    @faction = Faction.find(params[:id])
    @faction.destroy

    respond_to do |format|
      format.html { redirect_to(factions_url) }
      format.xml  { head :ok }
    end
  end
end
