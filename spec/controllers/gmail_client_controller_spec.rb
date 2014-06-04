require 'spec_helper'

describe GmailClientController do

	describe "#login" do
		it "should successfully login" do
			post :connect, {:username => ENV['USERNAME'], :password => ENV['PASSWORD']}
			response.should be_success
		end
	end
	
end
