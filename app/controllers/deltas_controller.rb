class DeltasController < ApplicationController
  def index
  	start_date = Date.today
  	end_date = start_date >> 3
    Bill.generate_payments start_date, end_date
    @payments = Payment.order :pay_on

    @balance = 0
  end
end
