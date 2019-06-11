# frozen_string_literal: true

Given(/^that I have a valid creation contract$/) do
  @order = MoipAPI.new.generate_order
end

Given(/^that I have a valid creation contract whit two item$/) do
  @order = MoipAPI.new.generate_order(type = false)
end

Given(/^that I have a valid creation contract whit existing custumer$/) do
  @order = MoipAPI.new.generate_order_existing_custumer
end

Given(/^that I have a invalid creation contract whit fields maximum character limit "([^"]*)"$/) do |field|
  @order = MoipAPI.new.generate_order_invalid(field)
end

Given(/^that I have a invalid creation contract whit field different currency "([^"]*)"$/) do |field|
  @order = MoipAPI.new.generate_order_invalid(field)
end

When(/^I send the requisition$/) do
  puts @order
  @response = HttpHelper.new.post('v2/orders', @order)
  temp = @response.body.to_s.encode('UTF-8', invalid: :replace, undef: :replace)
  puts "Response => #{temp}\n\n"
end

Then(/^I receive confirmation of the creation$/) do
  HttpHelper.new.handler(@response, 201)
  @id = @response['id']
  puts "Id Wirecard: #{@id}\n\n"
end

Then(/^I receive message of error bad request$/) do
  HttpHelper.new.handler(@response, 400)
  @field = @response['errors'][0]['path']
  @description = @response['errors'][0]['description']
  puts "Field: #{@field}\n\n"
  puts "Description: #{@description}\n\n"
end
