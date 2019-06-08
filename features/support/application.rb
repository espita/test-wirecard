class ApplicationSettings
  def setup!
    setup_defaults!
  end

  private

  def setup_defaults!
    $env = ENV['ENV'] || 'qa'
    puts 'Working on ' + $env

    $moip_url = {
      'qa' => 'https://sandbox.moip.com.br',
    }

    end
end
