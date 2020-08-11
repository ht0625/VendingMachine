class DrinkController
  def initialize
    @stock = 5
    @drinks = []
  end
  def display_drinks
    @drinks
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

  def get_price(name)
    @drinks.each do |d|
      if (name == d[:name])
        return d[:price]
      end
    end
  end

  def get_stock(name)
    @drinks.each do |d|
      if (name == d[:name])
        return d[:stock]
      end
    end
  end

  def sell_drink(drink)
    @drinks.each_with_index do |d , i|
      if d[:name] == drink
        @drinks[i][:stock] -= 1
      end
    end
    @drinks
  end

end
