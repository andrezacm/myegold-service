require 'gmail'

class GmailClientController < ApplicationController

	def connect
		@gmail_client = Gmail.new(params[:username], params[:password])
		render json: params[:username], status: 200
	end

end
