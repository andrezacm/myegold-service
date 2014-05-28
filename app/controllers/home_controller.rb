class HomeController < ApplicationController
  def show
=begin
		gmail = Gmail.connect('andreza.cmedeiros', 'euhacmeuhacm')
		puts 'OPA>>'+ gmail.inbox.count(:unread)
		# play with your gmail...
		gmail.logout
=end
  end
end
