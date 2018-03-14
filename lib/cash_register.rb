class CashRegister
  
  attr_accessor :total, :discount, :transaction_total
  
  @@items = []
  
  def initialize(discount = 0)
    @total = 0
    @discount = discount
  end
  
  def total
    @total
  end
  
  def transaction_total
    @transaction_total
  end
  
  def add_item(item, price, quantity = 1)
    self.total += price*quantity
    #@items = []
    @@items.fill(item, @@items.size, quantity)
    self.transaction_total = 0
    self.transaction_total += price*quantity
  end
  
  def apply_discount
    if @discount > 0 
      self.total -= @total*@discount/100
      return "After the discount, the total comes to $#{self.total}."
    else return "There is no discount to apply."
    end
  end
  
  def items
    @@items
  end
  
  def void_last_transaction
    self.total -= self.transaction_total
  end
  
end
