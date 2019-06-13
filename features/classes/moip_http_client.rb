# frozen_string_literal: true

# encode: UTF-8

class MoipAPI
  def initialize
    @auth = YAML.load_file('./config/authentication.yml')
  end

  def generate_code(number)
    charset = Array('A'..'Z') + Array('1'..'10')
    Array.new(number) { charset.sample }.join
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
    end
    @order
  end

  def generate_order_existing_customer
    @order = YAML.load_file('./fixtures/order.yml')['customerId']
    @order['ownId'] = $order_code
    @order['items'][0]['price'] = Faker::Number.positive(1000, 2000)
    @order
  end

  def generate_order_invalid(field)
    @order = YAML.load_file('./fixtures/order.yml')['oneItem']
    case field
    when 'ownId'
      @order['ownId'] = generate_code(46)

    when 'currency'
      @order['ownId'] = $order_code
      @order['amount']['currency'] = 'USDR'

    when 'idCurrency'
      @order['ownId'] = $order_code
      @order['amount']['currency'] = Faker::Currency.unique.code

    when 'product'
      @order['ownId'] = $order_code
      @order['items'][0]['product'] = Faker::Lorem.sentence(251)

    when 'customer'
      @order['ownId'] = $order_code
      @order['customer']['fullname'] = ''

    when 'idCustomer'
      @order = YAML.load_file('./fixtures/order.yml')['customerId']
      @order['ownId'] = $order_code
      @order['customer']['id'] = 'CUS-DF83DIPABEER'

    end
    @order
  end

  def generate_payment(type = true)
    @payment = YAML.load_file('./fixtures/payment_card.yml')

    @payment['fundingInstrument']['creditCard']['holder']['fullname'] = Faker::Name.name
    @payment['fundingInstrument']['creditCard']['holder']['taxDocument']['number'] = Faker::CPF.numeric

    if type == false
      @payment = YAML.load_file('./fixtures/payment_bankslip.yml')
    end
    @payment
  end
end
