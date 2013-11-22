class HomeController < ApplicationController
  def index
    @events = sjdug_organizer.upcoming_events(limit: 3)
    @current_event = @events.first
  end
end
