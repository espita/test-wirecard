# frozen_string_literal: true

class HttpHelper
  def initialize
    @auth = YAML.load_file('./config/authentication.yml')
    @order = YAML.load_file('./fixtures/order.yml')
  end

  def post(path, contract)
    json = contract.to_json
    HTTParty.post("#{$wirecard_url}/#{path}",
                  body: json,
                  headers: { 'Content-Type' => 'application/json' },
                  basic_auth: {
                    username: @auth['wirecard']['usr'],
                    password: @auth['wirecard']['pass']
                  })
  end

  def handler(response, http_code)
    if response.code != http_code
      raise "\n• RESPONSE CODE: #{response.code}
                  \n• RESPONSE ERROR MSG: #{response.message}
                  \n• RESPONSE BODY: #{response.body}
                  \n• RESPONSE HEADERS: #{response.headers.inspect}
                  \n• REQUEST BODY: #{!$requestJson.nil? ? JSON.minify($requestJson) : nil}
                  \n\n\n"
    end
  end
end

# "www.wirecard.com/v2/"
# post("create/order", @order)
# "www.wirecard.com/v2/create/order"
