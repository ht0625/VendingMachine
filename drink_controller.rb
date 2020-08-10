class DrinkController
  def initialize
    @stock = 5
    @drinks = []
  end

  def stock_add(drink)
    add_switch = 1
    @drinks.each_with_index do |d , i|
      if d[:name] == drink[:name]
        @drinks[i][:stock] += 1
        add_switch = 0
      end
    end
    if add_switch == 1
      @drinks << {**drink,stock: @stock}
    end
    @drinks
  end

  def purchase?(name,total)
    @drinks.each do |d|
      if (name == d[:name]) && ( d[:price] <= total)
        return true
      end
    end
    false
  end

  def sale(drink)
    @drinks.each_with_index do |d , i|
      if d[:name] == drink
        @drinks[i][:stock] -= 1
      end
    end
    @drinks
  end

end
