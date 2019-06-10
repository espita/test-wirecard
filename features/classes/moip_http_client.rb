# frozen_string_literal: true

class MoipAPI
  def initialize
    @auth = YAML.load_file('./config/authentication.yml')
    @order = YAML.load_file('./fixtures/order.yml')
  end

  def generate_order(type = true)
    # set order id
    @order['ownId'] = $order_code
    @order['customer']['ownId'] = $order_code
    @order
  end
end
