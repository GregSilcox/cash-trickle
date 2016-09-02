class Repeater < ApplicationRecord
  belongs_to :entry

  # return a payment if there is one on the given day
  def payment date
    return unless period == "month"
    return unless entry.day == date.day_of_month
    payments.create!( who: entry.name, 
      amount: entry.amount, when: date )
  end
end
