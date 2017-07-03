class RepeatersController < ApplicationController
  before_action :set_repeater, only: [:show, :edit, :update, :destroy]

  # GET /repeaters
  # GET /repeaters.json
  def index
    @repeaters = Repeater.all # .order( { entry: :asc } )
  end

  # GET /repeaters/1
  # GET /repeaters/1.json
  def show
  end

  # GET /repeaters/new
  def new
    @repeater = Repeater.new
  end

  # GET /repeaters/1/edit
  def edit
  end

  # POST /repeaters
  # POST /repeaters.json
  def create
    @repeater = Repeater.new(repeater_params)

    respond_to do |format|
      if @repeater.save
        format.html { redirect_to @repeater, notice: 'Repeater was successfully created.' }
        format.json { render :show, status: :created, location: @repeater }
      else
        format.html { render :new }
        format.json { render json: @repeater.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /repeaters/1
  # PATCH/PUT /repeaters/1.json
  def update
    respond_to do |format|
      if @repeater.update(repeater_params)
        format.html { redirect_to @repeater, notice: 'Repeater was successfully updated.' }
        format.json { render :show, status: :ok, location: @repeater }
      else
        format.html { render :edit }
        format.json { render json: @repeater.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /repeaters/1
  # DELETE /repeaters/1.json
  def destroy
    @repeater.destroy
    respond_to do |format|
      format.html { redirect_to repeaters_url, notice: 'Repeater was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_repeater
      @repeater = Repeater.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def repeater_params
      params.require(:repeater).permit(:entry_id, :frequency, :period)
    end
end
