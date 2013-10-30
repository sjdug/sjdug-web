module Eventbrite
  class Organizer
    include Client

    def initialize(organization_id, options = {})
      @organization_id = organization_id
      @options = options
    end

    def events
      response = connection.get do |req|
        req.url "/json/organizer_list_events"
        req.params['id'] = @organization_id
        req.params['app_key'] = @options[:app_key] || @@app_key
      end

      # TODO: error handling

      response.body.events
    end
  end
end