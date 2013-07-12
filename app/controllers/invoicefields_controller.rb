class InvoicefieldsController < ApplicationController
  # GET /invoicefields
  # GET /invoicefields.json
  def index
    @invoicefields = Invoicefield.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @invoicefields }
    end
  end

  # GET /invoicefields/1
  # GET /invoicefields/1.json
  def show
    @invoicefield = Invoicefield.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @invoicefield }
    end
  end

  # GET /invoicefields/new
  # GET /invoicefields/new.json
  def new
    @invoicefield = Invoicefield.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @invoicefield }
    end
  end

  # GET /invoicefields/1/edit
  def edit
    @invoicefield = Invoicefield.find(params[:id])
  end

  # POST /invoicefields
  # POST /invoicefields.json
  def create
    @invoicefield = Invoicefield.new(params[:invoicefield])
    
    respond_to do |format|
      if @invoicefield.save
        format.html { redirect_to @invoicefield, notice: 'Invoicefield was successfully created.' }
        format.json { render json: @invoicefield, status: :created, location: @invoicefield }
      else
        format.html { render action: "new" }
        format.json { render json: @invoicefield.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /invoicefields/1
  # PUT /invoicefields/1.json
  def update
    @invoicefield = Invoicefield.find(params[:id])

    respond_to do |format|
      if @invoicefield.update_attributes(params[:invoicefield])
        format.html { redirect_to @invoicefield, notice: 'Invoicefield was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @invoicefield.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoicefields/1
  # DELETE /invoicefields/1.json
  def destroy
    @invoicefield = Invoicefield.find(params[:id])
    @invoicefield.destroy

    respond_to do |format|
      format.html { redirect_to invoicefields_url }
      format.json { head :no_content }
    end
  end
end
