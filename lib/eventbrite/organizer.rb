module Eventbrite
  class Organizer
    include Client

    attr_reader :id

    def initialize(organization_id, options = {})
      @id = organization_id
      @options = options
    end

    def events
      begin
        response = connection.get do |req|
          req.url "/json/organizer_list_events"
          req.params['id'] = @id
          req.params['app_key'] = @options[:app_key] || @@app_key
        end
        response.body.events.map { |record| Event.from_hash(record.event) }
      rescue
        []
      end
    end

    def upcoming_events(opts = {})
      today = DateTime.now.at_beginning_of_day
      upcoming_events = events.select { |event| event.start_date >= today }
      (limit = opts[:limit].to_i) >= 1 ?
        limit.times.map { |i|  upcoming_events[i] || Event.no_event } :
        upcoming_events
    end

    def ==(other)
      other && other.id == self.id
    end
  end
end