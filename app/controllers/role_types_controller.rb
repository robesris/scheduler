class RoleTypesController < ApplicationController
  # GET /role_types
  # GET /role_types.xml
  def index
    @role_types = RoleTypes.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @role_types }
    end
  end

  # GET /role_types/1
  # GET /role_types/1.xml
  def show
    @role_types = RoleTypes.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @role_types }
    end
  end

  # GET /role_types/new
  # GET /role_types/new.xml
  def new
    @role_types = RoleTypes.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @role_types }
    end
  end

  # GET /role_types/1/edit
  def edit
    @role_types = RoleTypes.find(params[:id])
  end

  # POST /role_types
  # POST /role_types.xml
  def create
    @role_types = RoleTypes.new(params[:role_types])

    respond_to do |format|
      if @role_types.save
        flash[:notice] = 'RoleTypes was successfully created.'
        format.html { redirect_to(@role_types) }
        format.xml  { render :xml => @role_types, :status => :created, :location => @role_types }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @role_types.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /role_types/1
  # PUT /role_types/1.xml
  def update
    @role_types = RoleTypes.find(params[:id])

    respond_to do |format|
      if @role_types.update_attributes(params[:role_types])
        flash[:notice] = 'RoleTypes was successfully updated.'
        format.html { redirect_to(@role_types) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @role_types.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /role_types/1
  # DELETE /role_types/1.xml
  def destroy
    @role_types = RoleTypes.find(params[:id])
    @role_types.destroy

    respond_to do |format|
      format.html { redirect_to(role_types_url) }
      format.xml  { head :ok }
    end
  end
end
