# frozen_string_literal: true

Given(/^that I have a valid creation contract$/) do
  @order = MoipAPI.new.generate_order
end

When(/^I send the requisition$/) do
  #pending 
  puts @order
    #@response = HttpHelper.new.post('v2/orders', @order)
end

Then(/^I receive confirmation of the creation$/) do
  HttpHelper.new.handler(@response, 200)
end
