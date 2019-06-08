require 'rspec'
require 'capybara'
require 'cucumber'
require 'capybara/cucumber'
require 'capybara/dsl'
require 'selenium-webdriver'
require 'pry'
require 'httparty'
require 'jsonpath'
require 'uuid'
require 'securerandom'
require 'rake'
require 'cucumber/rake/task'
require 'json/minify'
require 'yaml'
require "faker"
require "rubocop"
require "cpf_faker"

case ENV['BROWSER']
	when 'ff'
		# using firefox
		DRIVER = :firefox
		Capybara.register_driver :firefox do |app|
			Capybara::Selenium::Driver.new(app, :browser => :firefox)
		end
	else
		# using chrome
		DRIVER = :chrome
		Capybara.register_driver :chrome do |app|
			Capybara::Selenium::Driver.new(app, :browser => :chrome)
		end
end

Capybara.configure do |config|
	config.default_driver = DRIVER
	config.app_host = 'https://conta-sandbox.moip.com.br'
  config.default_max_wait_time = 30

end
