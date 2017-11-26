class Payment < ApplicationRecord
  belongs_to :repeater
  
  def self.from date, bill, repeater
  	find_or_create_by( payee: bill.payee, 
  	  amount: bill.amount, 
      due_on: date,
      repeater_id: repeater.id ).create_with( pay_on: date )
  end
end