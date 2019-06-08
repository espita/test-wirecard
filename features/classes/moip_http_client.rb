class MoipAPI

    def initialize
        @auth = YAML.load_file('./config/authentication.yml')
    end

end
