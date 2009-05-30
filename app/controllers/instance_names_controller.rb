class InstanceNamesController < ApplicationController
  # GET /instance_names
  # GET /instance_names.xml
  def index
    @instance_names = InstanceName.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @instance_names }
    end
  end

  # GET /instance_names/1
  # GET /instance_names/1.xml
  def show
    @instance_name = InstanceName.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @instance_name }
    end
  end

  # GET /instance_names/new
  # GET /instance_names/new.xml
  def new
    @instance_name = InstanceName.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @instance_name }
    end
  end

  # GET /instance_names/1/edit
  def edit
    @instance_name = InstanceName.find(params[:id])
  end

  # POST /instance_names
  # POST /instance_names.xml
  def create
    @instance_name = InstanceName.new(params[:instance_name])

    respond_to do |format|
      if @instance_name.save
        flash[:notice] = 'InstanceName was successfully created.'
        format.html { redirect_to(@instance_name) }
        format.xml  { render :xml => @instance_name, :status => :created, :location => @instance_name }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @instance_name.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /instance_names/1
  # PUT /instance_names/1.xml
  def update
    @instance_name = InstanceName.find(params[:id])

    respond_to do |format|
      if @instance_name.update_attributes(params[:instance_name])
        flash[:notice] = 'InstanceName was successfully updated.'
        format.html { redirect_to(@instance_name) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @instance_name.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /instance_names/1
  # DELETE /instance_names/1.xml
  def destroy
    @instance_name = InstanceName.find(params[:id])
    @instance_name.destroy

    respond_to do |format|
      format.html { redirect_to(instance_names_url) }
      format.xml  { head :ok }
    end
  end
end
