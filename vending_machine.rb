
require '/Users/tamura/workspace/VMtest/drink_controller.rb'
require '/Users/tamura/workspace/VMtest/money_controller.rb'
require '/Users/tamura/workspace/VMtest/drink.rb'
require '/Users/tamura/workspace/VMtest/money.rb'
class VendingMachine
  def initialize
    @money_controller = MoneyController.new
    @drink_controller = DrinkController.new
  end
  #Money
  def insert(name)
    money = Money.new(name)
    if money.valid?
      @money_controller.add_deposit(money.value)
    else
      name
    end
  end
  def display_deposit
    @money_controller.display_deposit
  end
  def get_eject
    @money_controller.eject
  end
  #Drink
  def insert_drink(name,price)
    drink = Drink.new(name,price)
    @drink_controller.stock_add(drink.to_h)
  end
  def purchasable?(name)
    if (display_deposit >= @drink_controller.get_price(name)) && (@drink_controller.get_stock(name) >= 1)
      true
    else
      false
    end
  end

  def display_drinks_stock
    @drink_controller.display_drinks
  end

  def get_sales_amount
    @money_controller.get_sales_amount
  end

  def sell_drink(name)
    if purchasable?(name)
      price = @drink_controller.get_price(name)
      @money_controller.sales(price)
      @drink_controller.sell_drink(name)
    end
    display_deposit
  end

end

#require '/Users/tamura/workspace/VMtest/vending_machine.rb'
#vm = VendingMachine.new
# vm.insert("100円玉")
# vm.insert("500円玉")
# vm.insert("1円玉")
# vm.display_deposit
# vm.get_eject
# vm.display_deposit

# vm.insert_drink("cola",120)

# vm.sell_drink("cola")
# vm.display_drinks_stock

# vm.get_sales_amount
