# frozen_string_literal: true
# encoding: utf-8
Given(/^that I have a valid creation contract$/) do
  @order = MoipAPI.new.generate_order
end

Given(/^that I have a valid creation contract whit two item$/) do
    @order = MoipAPI.new.generate_order(type = false)
  end  

Given(/^that I have a valid creation contract whit existing custumer$/) do
    @order = MoipAPI.new.generate_order(type = true)
  end

Given(/^that I have a invalid creation contract whit fields maximum character limit "([^"]*)"$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end  

When(/^I send the requisition$/) do
    puts @order
    @response = HttpHelper.new.post('v2/orders', @order)
    
    #binding.pry
    
    temp = @response.body.to_s.encode('UTF-8', invalid: :replace, undef: :replace)
    puts "Response => #{temp}\n\n"
end

Then(/^I receive confirmation of the creation$/) do
  HttpHelper.new.handler(@response, 201)
    @id = @response['id']
    puts "Id Wirecard: #{@id}\n\n"
end

Then(/^I receive message of error bad request$/) do
    pending # Write code here that turns the phrase above into concrete actions
  end
