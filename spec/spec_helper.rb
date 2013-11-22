# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
#require 'vcr'
require 'webmock/rspec'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

# Checks for pending migrations before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

RSpec.configure do |config|
  # ## Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  #config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  #config.use_transactional_fixtures = true

  # If true, the base class of anonymous controllers will be inferred
  # automatically. This will be the default behavior in future versions of
  # rspec-rails.
  config.infer_base_class_for_anonymous_controllers = false

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = "random"
end

class Randgen
  def self.organizer
    id = /\d{7}/.gen
    {
      url: "http://www.eventbrite.com/org/#{id}",
      description: /[:sentence:]/.gen,
      long_description: /[:sentence:]/.gen,
      name: /\w{5,15}/.gen
    }
  end

  def self.event
    id = /\d{7}/.gen
    title = /\w{3,7} \w{7} \w{5,15}/.gen
    {
        id: id,
        title: title,
        start_date: /[:datetime:]/.gen,
        end_date: /[:datetime:]/.gen,
        box_header_text_color: /[:hex_color:]/.gen,
        locale: 'en_CA',
        link_color: /[:hex_color:]/.gen,
        box_background_color: /[:hex_color:]/.gen,
        box_border_color: /[:hex_color:]/.gen,
        timezone: 'North America/Halifax',
        organizer: /[:organizer:]/.gen,
        background_color: /[:hex_color:]/.gen,
        category: 'meetings,social',
        box_header_background_color: /[:hex_color:]/.gen,
        capacity: /\d{1,2}/.gen,
        num_attendee_rows: nil,
        status: 'Completed',
        description: /[:sentence:]/.gen,
        tags: '',
        timezone_offset: 'GMT+0000',
        text_color: /[:hex_color:]/.gen,
        title_text_color: "",
        tickets: [{
          ticket: {
            id: /\d{7}/.gen,
            description: '',
            end_date: /[:datetime:]/.gen,
            min: 1,
            max: nil,
            price: '0.00',
            visible: 'true',
            currency: 'CDN',
            display_price: '0.00',
            type: 0,
            name: 'General'
          }
        }],
        created: /[:datetime:]/.gen,
        url: "https://www.eventbrite.ca/e/#{title.dasherize}-#{id}",
        box_text_color: /[:hex_color:]/.gen,
        privacy: "Public",
        venue: {
            id: /\d{7}/,
            city: 'Fake Town',
            name: 'The Meeting Place',
            country: 'Canada',
            region: 'NB',
            longitude: -67,
            postal_code: 'A1C',
            address_2: '',
            address: '123 Fake Street',
            latitude: 45,
            country_code: 'CA'
        },
        modified: /[:datetime:]/.gen,
        repeats: 'no'
    }
  end

  def self.hex_color
    codes = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 'a', 'b', 'c', 'd', 'e', 'f']
    6.times.map { codes[rand(0...codes.length)] }.join
  end

  def self.datetime
    /\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}/.gen
  end
end