describe Eventbrite::Organizer do
  let(:organizer) { Eventbrite::Organizer.new('5100157935', app_key: 'J5HPMMR55MXVR6KVAB') }

  before do
    VCR.insert_cassette 'organizer', :record => :once
  end

  after do
    VCR.eject_cassette
  end

  it "must have a events method" do
    organizer.should respond_to(:events)
  end

  it "gets a list of events" do
    organizer.events.to be_a_kind_of(Array)
  end
end