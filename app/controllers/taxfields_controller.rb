class TaxfieldsController < ApplicationController
  # GET /taxfields
  # GET /taxfields.json
  def index
    @taxfields = Taxfield.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @taxfields }
    end
  end

  # GET /taxfields/1
  # GET /taxfields/1.json
  def show
    @taxfield = Taxfield.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @taxfield }
    end
  end

  # GET /taxfields/new
  # GET /taxfields/new.json
  def new
    @taxfield = Taxfield.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @taxfield }
    end
  end

  # GET /taxfields/1/edit
  def edit
    @taxfield = Taxfield.find(params[:id])
  end

  # POST /taxfields
  # POST /taxfields.json
  def create
    @taxfield = Taxfield.new(params[:taxfield])

    respond_to do |format|
      if @taxfield.save
        format.html { redirect_to @taxfield, notice: 'Taxfield was successfully created.' }
        format.json { render json: @taxfield, status: :created, location: @taxfield }
      else
        format.html { render action: "new" }
        format.json { render json: @taxfield.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /taxfields/1
  # PUT /taxfields/1.json
  def update
    @taxfield = Taxfield.find(params[:id])

    respond_to do |format|
      if @taxfield.update_attributes(params[:taxfield])
        format.html { redirect_to @taxfield, notice: 'Taxfield was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @taxfield.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /taxfields/1
  # DELETE /taxfields/1.json
  def destroy
    @taxfield = Taxfield.find(params[:id])
    @taxfield.destroy

    respond_to do |format|
      format.html { redirect_to taxfields_url }
      format.json { head :no_content }
    end
  end
end
