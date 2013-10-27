class EventPresenter
  def initialize(event)
    @event = event ? event['event'] : { }
  end

  def title
    @event['title'] || 'N/A'
  end

  def start_date
    if @event['start_date']
      date_to_format = Date.parse @event['start_date']
      date_to_format.strftime '%B %-d, %Y'
    end
  end
end