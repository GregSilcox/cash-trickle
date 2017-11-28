# Who and amount of a repeating or single bill or income.
class Bill < ApplicationRecord
  has_many :repeaters

  def self.generate_payments start_date, end_date
    Bill.all.each do |bill|
      bill.repeaters.each do |repeater|
        repeater.generate_payments start_date, end_date
      end     
    end
  end
end
