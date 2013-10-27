module HomeHelper
  def get_events
    eb_client = EventbriteClient.new({
      app_key: ENV['EVENTBRITE_APP_KEY'],
      user_key: ENV['EVENTBRITE_USER_KEY']
    })
    response_data = eb_client.user_list_events()

    today = Date.today
    future_events = response_data['events'].select do |event_data|
      event_date = Date.parse event_data['event']['start_date']
      event_date >= today
    end

    previous_events = response_data['events'].select do |event_data|
      event_date = Date.parse event_data['event']['start_date']
      event_date < today
    end

    { next_event: future_events[1], current_event: future_events[0], previous_event: previous_events[0] }
  end
end
