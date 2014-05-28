require 'spec_helper'

describe SessionsController do

	before do
  	request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]
  end

  describe "GET 'create'" do
    it "returns http success" do
      get 'create'
      response.should be_success
			#expect(response.status).to eq 200
    end
  end

  describe "GET 'destroy'" do
    it "returns http success" do
      get 'destroy'
      response.should be_success
    end
  end

end
