class Payment < ApplicationRecord
  belongs_to :repeater
  
  def self.from date, bill, repeater
  	Payment.
      create_with( 
        amount: bill.amount, 
        pay_on: date.to_datetime ).
      find_or_create_by( 
    	  due_on: date.to_datetime,
        repeater_id: repeater.id )
  end
end