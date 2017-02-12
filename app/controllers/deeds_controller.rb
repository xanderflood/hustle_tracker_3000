class DeedsController < ApplicationController
  before_action :set_deed, only: [:show, :edit, :update, :destroy, :start, :pause, :do]
  before_action :set_hustle, only: [:new, :create, :destroy, :start, :pause, :do]

  # GET /deeds
  # GET /deeds.json
  def index
    @deeds = Deed.all
  end

  # # GET /deeds/1
  # # GET /deeds/1.json
  # def show
  # end

  # GET /deeds/new
  def new
    @deed = Deed.new
  end

  # GET /deeds/1/edit
  def edit
  end

  # POST /deeds
  # POST /deeds.json
  def create
    @deed = @hustle.deeds.new(deed_params)

    respond_to do |format| 
     if @deed.save
        format.html { redirect_to @hustle, notice: 'deed created' }
        format.json { render :show, status: :created, location: @deed }
      else
        format.html { render :new }
        format.json { render json: @deed.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /deeds/1
  # PATCH/PUT /deeds/1.json
  def update
    respond_to do |format|
      if @deed.update(deed_params)
        format.html { redirect_to @deed, notice: 'Deed was successfully updated.' }
        format.json { render :show, status: :ok, location: @deed }
      else
        format.html { render :edit }
        format.json { render json: @deed.errors, status: :unprocessable_entity }
      end
    end
  end

  def start
    @deed.start
    respond_to do |format|
      if @deed.save
        format.html { redirect_to @hustle, notice: 'deed started' }
        format.json { render :show, status: :created, location: @deed }
      else
        format.html { redirect_to :back }
        format.json { render json: @deed.errors, status: :unprocessable_entity }
      end
    end
  end

  def pause
    @deed.pause
    respond_to do |format|
      if @deed.save
        format.html { redirect_to @hustle, notice: 'deed paused' }
        format.json { render :show, status: :created, location: @deed }
      else
        format.html { render :new }
        format.json { render json: @deed.errors, status: :unprocessable_entity }
      end
    end
  end

  def do
    @deed.do
    respond_to do |format|
      if @deed.save
        format.html { redirect_to @hustle, notice: 'deed done' }
        format.json { render :show, status: :created, location: @deed }
      else
        format.html { render :new }
        format.json { render json: @deed.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /deeds/1
  # DELETE /deeds/1.json
  def destroy
    @deed.destroy
    respond_to do |format|
      binding.pry
      format.html { redirect_to @hustle, notice: 'Deed was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_hustle
      @hustle = Hustle.find params[:hustle_id] rescue @hustle = @deed.hustle
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_deed
      @deed = Deed.find params[:id] rescue @deed = Deed.find params[:deed_id]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def deed_params
      params.require(:deed).permit(:hustle_id, :desc, :points, :state)
    end
end
