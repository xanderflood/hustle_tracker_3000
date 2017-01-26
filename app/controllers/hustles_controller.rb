class HustlesController < ApplicationController
  before_action :set_hustle, only: [:show, :edit, :update, :destroy]

  # GET /hustles
  # GET /hustles.json
  def index
    @hustles = Hustle.all
  end

  # GET /hustles/1
  # GET /hustles/1.json
  def show
  end

  # GET /hustles/new
  def new
    @hustle = Hustle.new
  end

  # GET /hustles/1/edit
  def edit
  end

  # POST /hustles
  # POST /hustles.json
  def create
    @hustle = Hustle.new(
      user: current_user,
      name: params[:name],
      created: Time.now,
      modified: Time.now
    )

    respond_to do |format|
      if @hustle.save
        format.html { redirect_to @hustle, notice: 'Hustle was successfully created.' }
        format.json { render :show, status: :created, location: @hustle }
      else
        format.html { render :new }
        format.json { render json: @hustle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hustles/1
  # PATCH/PUT /hustles/1.json
  def update
    hustle_params = {
      user: current_user,
      name: params[:name],
      modified: Time.now
    }
    respond_to do |format|
      if @hustle.update(hustle_params)
        format.html { redirect_to @hustle, notice: 'Hustle was successfully updated.' }
        format.json { render :show, status: :ok, location: @hustle }
      else
        format.html { render :edit }
        format.json { render json: @hustle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hustles/1
  # DELETE /hustles/1.json
  def destroy
    @hustle.destroy
    respond_to do |format|
      format.html { redirect_to hustles_url, notice: 'Hustle was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hustle
      @hustle = Hustle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    # def hustle_params
    #   params.require(:hustle).permit(:user_id, :name, :created, :modified)
    # end
end
