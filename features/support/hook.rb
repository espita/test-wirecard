# frozen_string_literal: true

Before do |scenario|
  $order_code = Time.now.to_i.to_s[2..Time.now.to_i.to_s.length]
  $generic_order_code = SecureRandom.uuid.to_s.gsub('-', '')
  puts "orderCode: #{$order_code}\n"
end
