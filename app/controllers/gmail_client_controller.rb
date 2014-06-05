require 'gmail'

class GmailClientController < ApplicationController

	def connect
		set_sessions(params[:username], params[:password])
		set_client
		render json: params[:username], status: 200
	end

	def set_client
		@gmail_client = Gmail.new(session[:username], session[:password])
	end

	def set_sessions username, password
		session[:username] = params[:username]
		session[:password] = params[:password]
	end

	def inbox
		 #render json: {"message"=> "Permission deneid"}, status: 401	
		set_sessions params[:username], params[:password]
		set_client
		
		emails = []
		@gmail_client.inbox.emails.each do |email|
			emails << email.subject
		end
		render json: emails, status: 200
	end

	def new_message
		set_sessions params[:username], params[:password]
		set_client

		@gmail_client.deliver do
			to params[:to]
			subject params[:subject]
			text_part do
				body params[:body]
			end
		end
		render json: {"message" => "OK"}, status: 200
	end	
end
