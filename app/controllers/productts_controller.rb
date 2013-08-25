class ProducttsController < ApplicationController
  # GET /productts
  # GET /productts.json
  include RottenTomatoes
  def index
    @productts = Productt.all
    Rotten.api_key = "9zumcg5xarr8nw3urcz6gj69"
    @movie = RottenList.find(:type => "upcoming")
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @productts }
    end
  end

  # GET /productts/1
  # GET /productts/1.json
  def show
    Rotten.api_key = "9zumcg5xarr8nw3urcz6gj69"
    @movie = RottenMovie.find(:id => params[:id]) #params[:id]) #RottenList.find(:id=>771267761)
    @comment = Comment.new
    @comments = Comment.all
  end

  # GET /productts/new
  # GET /productts/new.json
  def new
    @productt = Productt.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @productt }
    end
  end

  # GET /productts/1/edit
  def edit
    @productt = Productt.find(params[:id])
  end

  # POST /productts
  # POST /productts.json
  def create
    @productt = Productt.new(params[:productt])

    respond_to do |format|
      if @productt.save
        format.html { redirect_to @productt, notice: 'Productt was successfully created.' }
        format.json { render json: @productt, status: :created, location: @productt }
      else
        format.html { render action: "new" }
        format.json { render json: @productt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /productts/1
  # PUT /productts/1.json
  def update
    @productt = Productt.find(params[:id])

    respond_to do |format|
      if @productt.update_attributes(params[:productt])
        format.html { redirect_to @productt, notice: 'Productt was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @productt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /productts/1
  # DELETE /productts/1.json
  def destroy
    @productt = Productt.find(params[:id])
    @productt.destroy

    respond_to do |format|
      format.html { redirect_to productts_url }
      format.json { head :no_content }
    end
  end
end
