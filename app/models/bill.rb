# Who and amount of a repeating or single bill or income.
class Bill < ApplicationRecord
  has_many :repeaters

  def dates range, day
    range.each do |date|
      d = Date.new date.year, date.month, day
    end
  end
end
