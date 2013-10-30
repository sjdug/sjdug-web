module Eventbrite
  module Client
    def self.app_key=(app_key)
      @@app_key = app_key
    end

    def connection
      @client ||= Faraday.new(url: 'https://www.eventbrite.com/') do |client|
        client.response :logger
        client.response :json
        client.response :rashify
        client.response :follow_redirects
        client.use      :instrumentation
        client.adapter  :excon
      end
    end
  end
end