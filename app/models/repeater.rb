class Repeater < ApplicationRecord
  has_many :payments
  belongs_to :bill

  # this is intended for monthly payments
  def generate_payments start_date, end_date
  	dates = start_date.step( end_date ).
  	  select { |date| date.day == bill.due_on }.
  	  map { |date| Payment.from date, bill, self }
  end
end
# 1. for a given entry, say Mortgage on the 15 of every month,
# 2. return the Mortgage dates between April 7 and June 12.
# 3. or return the Mortgage payments for 90 days starting today