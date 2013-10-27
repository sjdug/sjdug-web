class HomeController < ApplicationController
  def index
    # TODO - move out of HomeHelper and into API class
    events = view_context.get_events()
    @current_event = EventPresenter.new events[:current_event]
    @next_event = EventPresenter.new events[:next_event]
    @previous_event = EventPresenter.new events[:previous_event]
  end
end
