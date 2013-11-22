require 'rash'

module Eventbrite
  class Event
    def self.from_hash(hash)
      Event.new(hash['id'], hash)
    end

    def self.no_event
      Event.new(nil, title: 'No Event Scheduled')
    end

    attr_reader :id, :title, :url, :description, :presented_by, :start_date, :end_date

    def initialize(event_id, opts = {})
      @id = event_id
      opts = Hashie::Rash.new(opts)
      @title = opts.title
      @description = opts.description
      @url = opts.url
      @presented_by = ''
      @start_date = DateTime.parse(opts.start_date) if opts.start_date
      @end_date = DateTime.parse(opts.end_date) if opts.end_date
    end

    def ==(other)
      other && other.id == self.id
    end
  end
end
