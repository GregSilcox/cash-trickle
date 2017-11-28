class BillsController < ApplicationController
  before_action :set_model, 
    only: [:show, :edit, :update, :destroy]

  def index
    @bills = Bill.all
  end

  def show
  end

  def new
    @bill = Bill.new
  end

  def edit
  end

  def create
    @bill = Bill.new model_params

    respond_to do |format|
      if @bill.save
        format.html { redirect_to @bill, notice: 'Bill was successfully created.' }
        format.json { render :show, status: :created, location: @bill }
      else
        format.html { render :new }
        format.json { render json: @bill.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @bill.update model_params
        format.html { redirect_to @bill, notice: 'Bill was successfully updated.' }
        format.json { render :show, status: :ok, location: @bill }
      else
        format.html { render :edit }
        format.json { render json: @bill.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @bill.destroy
    respond_to do |format|
      format.html { redirect_to entries_url, notice: 'Bill was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_model
      @bill = Bill.find params[ :id ]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def model_params
      params.
        require( :bill ).
        permit( :payee, :amount, :due_on, :note )
    end
end
