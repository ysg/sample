class IngridientsController < ApplicationController
  # GET /ingridients
  # GET /ingridients.json
  def index
    @ingridients = Ingridient.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ingridients }
    end
  end

  # GET /ingridients/1
  # GET /ingridients/1.json
  def show
    @ingridient = Ingridient.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ingridient }
    end
  end

  # GET /ingridients/new
  # GET /ingridients/new.json
  def new
    @ingridient = Ingridient.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ingridient }
    end
  end

  # GET /ingridients/1/edit
  def edit
    @ingridient = Ingridient.find(params[:id])
  end

  # POST /ingridients
  # POST /ingridients.json
  def create
    @ingridient = Ingridient.new(params[:ingridient])

    respond_to do |format|
      if @ingridient.save
        format.html { redirect_to @ingridient, notice: 'Ingridient was successfully created.' }
        format.json { render json: @ingridient, status: :created, location: @ingridient }
      else
        format.html { render action: "new" }
        format.json { render json: @ingridient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ingridients/1
  # PUT /ingridients/1.json
  def update
    @ingridient = Ingridient.find(params[:id])

    respond_to do |format|
      if @ingridient.update_attributes(params[:ingridient])
        format.html { redirect_to @ingridient, notice: 'Ingridient was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ingridient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ingridients/1
  # DELETE /ingridients/1.json
  def destroy
    @ingridient = Ingridient.find(params[:id])
    @ingridient.destroy

    respond_to do |format|
      format.html { redirect_to ingridients_url }
      format.json { head :no_content }
    end
  end
end
