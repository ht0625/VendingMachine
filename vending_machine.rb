require 'byebug'
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
      @money_controller.add_total(money.value)
    else
      name
    end
  end
  def get_total
    @money_controller.total
  end
  def get_eject
    @money_controller.eject
  end
  #Drink
  def insert_drink(name,price)
    drink = Drink.new(name,price)
    @drink_controller.stock_add(drink.to_h)
  end
  def choose_drink(name)
    @drink_controller.purchase?(name,get_total)
    #@drink_controller.sale(name)
  end
end

 #require '/Users/tamura/workspace/VMtest/vending_machine.rb'
 vm = VendingMachine.new
 byebug
# vm.insert("100円玉")
# vm.insert("500円玉")
# vm.insert("1円玉")
# vm.get_total
# vm.get_eject
# vm.get_total

# vm.insert_drink("cola",120)
puts "END"
