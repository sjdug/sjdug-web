module HomeHelper
  def friendly_date(event)
    return '' unless event.start_date
    event.start_date.strftime('%B %d, %Y')
  end

  def column_size
    12 / @events.length
  end
end
