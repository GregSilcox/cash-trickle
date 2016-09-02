class Collector < Range
  def payments
    day = self.begin
    arr = []
    repeaters = Repeaters.all

    while day <= self.end do
      repeaters.each do |repeater|
        payment = repeater.payment day
        arr << payment if payment
        day += 1.day
      end
    end

    return arr
  end
end
