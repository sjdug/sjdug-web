require 'spec_helper'

describe MailingListController do

  describe "GET 'subscribe'" do
    it "returns http success" do
      get 'subscribe'
      response.should be_success
    end
  end

end
