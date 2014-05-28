require "spec_helper"

feature "Login Feature" do

	scenario 'login failure' do
    mock_auth = OmniAuth.config.mock_auth[:google_oauth2]
    OmniAuth.config.mock_auth[:github] = :invalid_credentials
		get 'auth/google_oauth2'
		
  end

end
