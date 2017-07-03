class DeltasController < ApplicationController
  def index
  	start_date = Date.today
  	end_date = start_date >> 3

    @payments = Entry.all.each do |entry|
	  entry.repeaters.each do |repeater|
	  	repeater.xpayments start_date, end_date
	  end    	
    end
    @balance = 0
  end
end
