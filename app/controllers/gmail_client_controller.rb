require 'gmail'

class GmailClientController < ApplicationController

	def connect
		set_client
		render json: current_user, status: 200
	end

	def set_client
		user = current_user
		@gmail_client = Gmail.new(user.username, user.psw)
	end

	def inbox
		set_client
		
		emails = []
		@gmail_client.inbox.emails.each do |email|
			emails << email.subject
		end
		render json: emails, status: 200
	end

	def new_message
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
