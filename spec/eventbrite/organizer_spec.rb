describe Eventbrite::Organizer do
  let(:organizer) { Eventbrite::Organizer.new('TEST_ORG_ID', app_key: 'TEST_APP_KEY') }

  before do
    stub_request(:get, 'https://www.eventbrite.com/json/organizer_list_events')
      .with(query: { app_key: 'TEST_APP_KEY', id: 'TEST_ORG_ID' })
      .to_return(body: create_events.to_json, status: 200)
  end

  it 'must have an id' do
    organizer.id.should eq('TEST_ORG_ID')
  end

  it 'gets a list of events' do
    events = organizer.events
    events.should be_a_kind_of(Array)
    events.length.should eq(10)
  end

  context 'upcoming events' do
    it 'gets all the upcoming events from today' do
      upcoming_events = organizer.upcoming_events
      upcoming_events.should be_a_kind_of(Array)
      upcoming_events.length.should eq(5)
    end

    it 'gets the upcoming X events from today' do
      upcoming_events = organizer.upcoming_events(limit: 3)
      upcoming_events.length.should eq(3)
    end

    it 'gets the upcoming X events from and uses empty events if there are not enough upcoming' do
      upcoming_events = organizer.upcoming_events(limit: 6)
      upcoming_events.length.should eq(6)
      upcoming_events.last.should eq(Eventbrite::Event.no_event)
    end
  end

  def create_events
    date = DateTime.now - 5.days
    events = 10.times.map do
      event = /[:event:]/.gen
      event[:start_date] = date.to_s(:db)
      event[:end_date] = (date + 1.hour).to_s(:db)
      date += 1.day
      { event: event }
    end
    { events: events }
  end
end