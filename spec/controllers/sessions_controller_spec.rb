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
			session[:user_id].should be_nil 
			post :create, provider: :google_oauth2 
			session[:user_id].should_not be_nil
		end

		it "should returns http success" do
			visit '/auth/google_oauth2'
			response.should be_success
		end
	end
	
	describe "#destroy" do
		before do
			post :create, provider: :google_oauth2 
		end

		it "should clear the session" do
			session[:user_id].should_not be_nil
			delete :destroy
			session[:user_id].should be_nil		
		end
	end
end
