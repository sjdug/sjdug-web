module Eventbrite
  class APIKeys < Faraday::Middleware
    def call(env)
      env[:request_headers]['APP_KEY']
      @app.call(env)
    end
  end
end