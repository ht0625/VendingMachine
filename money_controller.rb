class MoneyController
  def initialize
    @sale_amount = 0
    @change = 0
    @total = 0
  end
  def add_total(value)
    @total += value
  end
  def total
    @total
  end
  def eject
    @change = @total
    @total = 0
    @change
  end
  def sale
    @total -= @price
    @sale_amount += @price
  end
end
