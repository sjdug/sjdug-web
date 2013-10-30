require 'faraday'
require 'eventbrite/client'
require 'eventbrite/organizer'
require 'eventbrite/event'
require 'eventbrite/api_keys'

module Eventbrite
  Faraday.register_middleware :request, api_keys: lambda { Eventbrite::APIKeys }
end