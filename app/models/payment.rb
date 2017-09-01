class Payment < ApplicationRecord
  belongs_to :repeater
  
  def self.from date, entry, repeater_id
  	find_or_create_by who: entry.name, 
  	  amount: entry.amount, 
      when: date,
      repeater_id: repeater_id
  end
end