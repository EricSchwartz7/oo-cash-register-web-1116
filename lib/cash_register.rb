require 'pry'
class CashRegister
  def initialize(percent=0)
    @total = 0
    @percent = percent
     @items_array = []
  end

  def discount
    @percent
  end

  attr_accessor :total, :last_transaction

  def add_item(item, price, quantity=1)
    quantity.times do 
      @items_array << item
    end
    self.total += price * quantity
    @last_transaction = price
  end

  def apply_discount
    if @percent == 0
      "There is no discount to apply."
    else
      self.total *= (0.01 * (100 - discount))
      "After the discount, the total comes to $#{total.to_i}."
    end
  end

  def items
      @items_array
  end

  def void_last_transaction
    self.total -= @last_transaction
  end


end


