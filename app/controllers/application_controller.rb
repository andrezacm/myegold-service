class ApplicationController < ActionController::API

#  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

	def sent_message task
		redirect_to '/gmail_client/new_message', :to => task[:to], :subject => task[:subject], :body => task[:message]
	end

end
