require 'rails_helper'
require 'rspec_api_documentation/dsl'

RspecApiDocumentation.configure do |config|
  config.api_name = "TacoChallenge"
  config.format = [:json]
  config.curl_headers_to_filter = %w(Host Cookie)
  config.curl_host = "http://localhost:3000"
end
