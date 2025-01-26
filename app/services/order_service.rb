class OrderService
  def initialize(order)
    @order = order
  end

  def process_order
    @order.verify_order
    @order.finalize_order
  rescue StandardError => e
    puts "Order failed: #{e.message}"
  end
end
