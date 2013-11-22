class MailingListController < ApplicationController
  def subscribe
    email = params[:email]
    # TODO: send email to mailchimp
    head :ok
  end
end
