require 'pry'


class CashRegister
  attr_reader :discount
  attr_accessor :total, :title

  @@all = []
  def initialize(discount = 20)
    @discount = discount
    @total = 0
  end

  def add_item(title, price, quantity = 1)
    @@all << title
    self.total += price * quantity
  end

  def apply_discount
    if 0 == @discount
      "There is no discount to apply."
    else
      discount_percent = 1 - @discount/100.to_f
      @total = @total * discount_percent
      "After the discount, the total comes to $#{@total.round}."
    end
  end

  def items()
    @@all
  end


end

c1 = CashRegister.new
c1.add_item("macbook air", 1000)
c1.add_item("iphone", 400)
# c2 = CashRegister.new
# c2.add_item("iphone", 500)
# c1.apply_discount
# c1.items("iphone", 500)
# c1.items("macbook air", 1000)
binding.pry