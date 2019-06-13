# frozen_string_literal: true

class Login
  include RSpec::Mocks::ExampleMethods::ExpectHost
  include RSpec::Matchers
  include Capybara::DSL

  def initialize
    @auth = YAML.load_file('./config/authentication.yml')
    end

  def logar
    visit(($conta_wirecard[$env]).to_s)
    fill_in('login', with: @auth['conta_sandbox']['usr'])
    fill_in('password', with: @auth['conta_sandbox']['pass'])
    click_on 'Acessar sua conta'
    end

  def modal
    @modal = page.find('#modal-header-content').text
    puts @modal
    if @modal == 'Gestão de dispositivos será lançada em breve!'
      page.find('.close').click

    else
      puts "Modal not present"
    end
  end
end
