# frozen_string_literal: true
# encode: UTF-8

class MoipAPI
  def initialize
    @auth = YAML.load_file('./config/authentication.yml')
  end

  def generate_order(type = true)
    # set order id
    @order = YAML.load_file('./fixtures/order.yml')['oneItem']

    @order['ownId'] = $order_code
    @order['customer']['ownId'] = $order_code
    @order['customer']['fullname'] = Faker::Name.name
    @order['customer']['email'] = Faker::Internet.email
    @order['customer']['taxDocument']['number'] = Faker::CPF.numeric
    @order['customer']['phone']['number'] = Faker::Number.number(9)
    @order['customer']['shippingAddress']['street'] = Faker::Address.street_name
    @order['customer']['shippingAddress']['streetNumber'] = Faker::Address.building_number
    @order['customer']['shippingAddress']['district'] = %w[Itaim Paulista Santana Moema Pinheiros Brooklin].sample
    @order['items'][0]['product'] = Faker::Beer.name
    @order['items'][0]['detail'] = Faker::Beer.style
    @order['items'][0]['price'] = Faker::Number.positive(1000, 3000)

    if type == false

      @order = YAML.load_file('./fixtures/order.yml')['twoItem']

      @order['ownId'] = $order_code
      @order['customer']['ownId'] = $order_code
      @order['customer']['fullname'] = Faker::Name.name
      @order['customer']['email'] = Faker::Internet.email
      @order['customer']['taxDocument']['number'] = Faker::CPF.numeric
      @order['customer']['phone']['number'] = Faker::Number.number(9)
      @order['customer']['shippingAddress']['street'] = Faker::Address.street_name
      @order['customer']['shippingAddress']['streetNumber'] = Faker::Address.building_number
      @order['customer']['shippingAddress']['district'] = %w[Itaim Paulista Santana Moema Pinheiros Brooklin].sample
      @order['items'][0]['product'] = Faker::Beer.name
      @order['items'][0]['detail'] = Faker::Beer.style
      @order['items'][0]['price'] = Faker::Number.positive(1000, 3000)
      @order['items'][1]['product'] = Faker::Beer.name
      @order['items'][1]['detail'] = Faker::Beer.style
      @order['items'][1]['price'] = Faker::Number.positive(1000, 3000)

  elsif type == true
    @order = YAML.load_file('./fixtures/order.yml')['custumerId']
    @order['ownId'] = $order_code
    @order['items'][0]['price'] = Faker::Number.positive(1000, 3000)
    end
    @order
  end
end