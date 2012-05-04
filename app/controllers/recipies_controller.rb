class RecipiesController < ApplicationController
  before_filter :check_for_cancel, :only => [:create, :update]


  # GET /recipies
  # GET /recipies.json
  def index
    @recipies = Recipy.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @recipies }
    end
  end

  # GET /recipies/1
  # GET /recipies/1.json
  def show
    @recipy = Recipy.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @recipy }
    end
  end

  # GET /recipies/new
  # GET /recipies/new.json
  def new
    @recipy = Recipy.new
    2.times {@recipy.ingridients.build}
    @items = Item.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @recipy }
    end
  end

  # GET /recipies/1/edit
  def edit
    @recipy = Recipy.find(params[:id])
    @items = Item.all
  end

  # POST /recipies
  # POST /recipies.json
  def create
    @recipy = Recipy.new(params[:recipy])

    respond_to do |format|
      if @recipy.save
        format.html { redirect_to @recipy, notice: 'Recipy was successfully created.' }
        format.json { render json: @recipy, status: :created, location: @recipy }
      else
        format.html { render action: "new" }
        format.json { render json: @recipy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /recipies/1
  # PUT /recipies/1.json
  def update
    @recipy = Recipy.find(params[:id])

    respond_to do |format|
      if @recipy.update_attributes(params[:recipy])
        format.html { redirect_to @recipy, notice: 'Recipy was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @recipy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipies/1
  # DELETE /recipies/1.json
  def destroy
    @recipy = Recipy.find(params[:id])
    @recipy.destroy

    respond_to do |format|
      format.html { redirect_to recipies_url }
      format.json { head :no_content }
    end
  end

  private

  def check_for_cancel
    if params[:commit] == "Cancel"
      redirect_to recipies_path
    end
  end
end
