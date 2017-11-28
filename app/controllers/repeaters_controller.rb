class RepeatersController < ApplicationController
  before_action :set_model, 
    only: [ :show, :edit, :update, :destroy ]

  def index
    @repeaters = Repeater.all # .order( { bill: :asc } )
  end

  def show
  end

  def new
    @repeater = Repeater.new
  end

  def edit
  end

  def create
    @repeater = Repeater.new(model_params)

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

  def update
    respond_to do |format|
      if @repeater.update(model_params)
        format.html { redirect_to @repeater, notice: 'Repeater was successfully updated.' }
        format.json { render :show, status: :ok, location: @repeater }
      else
        format.html { render :edit }
        format.json { render json: @repeater.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @repeater.destroy
    respond_to do |format|
      format.html { redirect_to repeaters_url, notice: 'Repeater was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_model
      @repeater = Repeater.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def model_params
      params.require(:repeater).
        permit(:bill_id, :frequency, :period)
    end
end
