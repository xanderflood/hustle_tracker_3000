class HustlesController < ApplicationController
  before_action :set_hustle, only: [:show, :edit, :update, :destroy, :rename]

  # GET /hustles
  # GET /hustles.json
  def index
    @hustles = current_user.hustles
    @rolls = current_user.rolls
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
      name: params[:hustle][:name],
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

  # def rename
  #   orig_name = @hustle.name
  #   @hustle.name = params[:name]
  #   respond_to do |format|
  #     if @hustle.save
  #       format.json { render json: { name: @hustle.name }, status: :ok, location: @hustle }
  #     else
  #       format.json { render json: { name: orig_name }, status: :unprocessable_entity }
  #     end
  #   end
  # end
 
  # PATCH/PUT /hustles/1
  # PATCH/PUT /hustles/1.json
  def update
    hustle_params = {
      user: current_user,
      name: params[:name],
      modified: Time.now
    }
    if @hustle.update(hustle_params)
      render json: hustle_params, status: :ok, location: @hustle
    else
      render json: @hustle.errors, status: :unprocessable_entity
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
