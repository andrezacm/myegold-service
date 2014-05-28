class SessionsController < ApplicationController

  def create
		auth = request.env["omniauth.auth"]
    user = User.where(:provider => auth['provider'],
                      :uid      => auth['uid']).first || User.from_omniauth(auth)

    session[:user_id] = user.id

    #redirect_to root_path
		render json: user, status: 200
  end

  def destroy
    #session[:user_id] = nil
    #redirect_to root_path
		reset_session
		render json: nil
  end

end
