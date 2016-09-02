# Payments, receipts, debits, credits.
class Occurrence
  attr_accessor :entry
  def name
    @entry.name
  end
end
