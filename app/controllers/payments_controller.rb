class PaymentsController < ApplicationController
  before_action :set_model, 
    only: [ :show, :edit, :update, :destroy ]

  def index
    @payments = Payment.order :pay_on
  end

  def show
  end

  def new
    @payment = Payment.new
  end

  def edit
  end

  def create
    @payment = Payment.new( model_params )

    respond_to do |format|
      if @payment.save
        format.html { redirect_to @payment, notice: 'Payment was successfully created.' }
        format.json { render :show, status: :created, location: @payment }
      else
        format.html { render :new }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @payment.update( model_params )
        format.html { redirect_to @payment, notice: 'Payment was successfully updated.' }
        format.json { render :show, status: :ok, location: @payment }
      else
        format.html { render :edit }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @payment.destroy
    respond_to do |format|
      format.html { redirect_to payments_url, notice: 'Payment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_model
      @payment = Payment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def model_params
      params.require( :payment ).
        permit( :who, :when, :amount, :repeater_id,
          :due_on, :pay_on, :paid_on )
    end
end
