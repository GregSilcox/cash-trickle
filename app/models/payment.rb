class Payment < ApplicationRecord
  belongs_to :repeater
  
  def from date, entry
  	find_or_create_by who: entry.name, 
  	  amount: entry.amount, 
      when: date
  end
end