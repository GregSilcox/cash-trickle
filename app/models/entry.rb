# Who and amount of a repeating or single bill or income.
class Entry < ApplicationRecord
  def dates range, day
    range.each do |date|
      d = Date.new date.year, date.month, day
    end
  end
end
