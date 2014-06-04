require 'spec_helper'

describe SessionsController do

	before do
  	request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]
  end

	describe "#create" do
		it "should successfully create a user" do
			expect {
        post :create, provider: :google_oauth2
      }.to change{ User.count }.by(1)
		end

		it "sould successfully create a session" do
			session[:uid].should be_nil 
			post :create, provider: :google_oauth2 
			session[:uid].should_not be_nil
		end

		it "should returns http success" do
			visit '/auth/google_oauth2'
			response.should be_success
		end
	end

=begin
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
=end
end
