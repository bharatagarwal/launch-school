class InvoiceEntry
  attr_reader :product_name
  attr_accessor :quantity

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    # prevent negative quantities from being set
    self.quantity = updated_count if updated_count >= 0
  end
end

# Alan looked at the code and spotted a mistake. "This will fail when update_quantity is called", he says.

entry = InvoiceEntry.new('MacBook Air', 9)
entry.update_quantity(-5)
p entry.quantity

entry.update_quantity(6)
p entry.quantity
