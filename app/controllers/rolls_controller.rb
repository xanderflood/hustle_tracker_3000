class RollsController < ApplicationController
  before_action :set_roll, only: [:show, :edit, :update, :destroy, :add]
  before_action :set_deed, only: [:add]

  # GET /rolls
  # GET /rolls.json
  def index
    @rolls = Roll.all
  end

  # GET /rolls/1
  # GET /rolls/1.json
  def show
    points = {}
    points.default = 0

    @roll.deeds.each { |d| points[d.state] += d.points }

    @points_in_states = points.map { |k,v| [k,v] }
  end

  # GET /rolls/new
  def new
    @roll = Roll.new
  end

  # GET /rolls/1/edit
  def edit
  end

  # POST /rolls
  # POST /rolls.json
  def create
    @roll = Roll.new(
      user: current_user,
      name: params[:roll][:name],
      deadline: DateTime.new(params[:roll]["deadline(1i)"].to_i,
                             params[:roll]["deadline(2i)"].to_i,
                             params[:roll]["deadline(3i)"].to_i,
                             params[:roll]["deadline(4i)"].to_i,
                             params[:roll]["deadline(5i)"].to_i)
    )

    respond_to do |format|
      if @roll.save
        format.html { redirect_to @roll, notice: 'Roll was successfully created.' }
        format.json { render :show, status: :created, location: @roll }
      else
        format.html { render :new }
        format.json { render json: @roll.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rolls/1
  # PATCH/PUT /rolls/1.json
  def update
    respond_to do |format|
      if @roll.update(roll_params)
        format.html { redirect_to @roll, notice: 'Roll was successfully updated.' }
        format.json { render :show, status: :ok, location: @roll }
      else
        format.html { render :edit }
        format.json { render json: @roll.errors, status: :unprocessable_entity }
      end
    end
  end

  def add
    @roll.deeds.push @deed
    respond_to do |format|
      if @roll.save
        format.html { redirect_to @roll, notice: 'deed added to roll' }
        format.json { render :show, status: :ok, location: @roll }
      else
        format.html { render :edit }
        format.json { render json: @roll.errors, status: :unprocessable_entity }
      end
    end
  end

  def finish
    @roll.finish
    respond_to do |format|
      if @roll.save
        format.html { redirect_to @roll, notice: 'roll finished!' }
        format.json { render :show, status: :ok, location: @roll }
      else
        format.html { render :edit }
        format.json { render json: @roll.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rolls/1
  # DELETE /rolls/1.json
  def destroy
    @roll.destroy
    respond_to do |format|
      format.html { redirect_to rolls_url, notice: 'Roll was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_roll
      @roll =  Roll.find(params[:roll_id].nil? ? params[:id] : params[:roll_id] )
    end

    def set_deed
      @deed = Deed.find(params[:deed_id])
    end 

    # Never trust parameters from the scary internet, only allow the white list through.
    def roll_params
      params.require(:roll)
    end
end
