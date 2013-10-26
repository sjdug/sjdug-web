class ApiController < ApplicationController
  respond_to :json

  def subscribe
    mc = Mailchimp::API.new ENV['MAILCHIMP_API_KEY']
    render json: mc.lists().subscribe(ENV['MAILCHIMP_LIST_ID'], Struct.new(:email).new(params[:email]))
  end
end
