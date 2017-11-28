# Payments, receipts, debits, credits.
class Occurrence
  attr_accessor :bill
  def payee
    @bill.payee
  end
end
