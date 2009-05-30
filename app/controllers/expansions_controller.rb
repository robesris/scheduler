class ExpansionsController < ApplicationController
  # GET /expansions
  # GET /expansions.xml
  def index
    @expansions = Expansion.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @expansions }
    end
  end

  # GET /expansions/1
  # GET /expansions/1.xml
  def show
    @expansion = Expansion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @expansion }
    end
  end

  # GET /expansions/new
  # GET /expansions/new.xml
  def new
    @expansion = Expansion.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @expansion }
    end
  end

  # GET /expansions/1/edit
  def edit
    @expansion = Expansion.find(params[:id])
  end

  # POST /expansions
  # POST /expansions.xml
  def create
    @expansion = Expansion.new(params[:expansion])

    respond_to do |format|
      if @expansion.save
        flash[:notice] = 'Expansion was successfully created.'
        format.html { redirect_to(@expansion) }
        format.xml  { render :xml => @expansion, :status => :created, :location => @expansion }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @expansion.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /expansions/1
  # PUT /expansions/1.xml
  def update
    @expansion = Expansion.find(params[:id])

    respond_to do |format|
      if @expansion.update_attributes(params[:expansion])
        flash[:notice] = 'Expansion was successfully updated.'
        format.html { redirect_to(@expansion) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @expansion.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /expansions/1
  # DELETE /expansions/1.xml
  def destroy
    @expansion = Expansion.find(params[:id])
    @expansion.destroy

    respond_to do |format|
      format.html { redirect_to(expansions_url) }
      format.xml  { head :ok }
    end
  end
end
