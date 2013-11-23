class MailingListController < ApplicationController
  def subscribe
    begin
      response = send_subscribe_request(params[:email])
      logger.debug response.inspect
      head :ok
    rescue Exception => e
      logger.error e
      head :error
    end
  end

  private
  def mailchimp_api
    Mailchimp::API.new(ENV['MAILCHIMP_API_KEY'])
  end

  def send_subscribe_request(email)
    mailing_list_id = ENV['MAILCHIMP_LIST_ID']
    request_params = Struct.new(:email).new(email)
    mailchimp_api.lists().subscribe(mailing_list_id, request_params)
  end
end
