class ActionsController < ApplicationController

	def send_action
		d1 = DateTime.now.in_time_zone('Brasilia')
		d2 = DateTime.now.in_time_zone('Brasilia') - 1.hour	

		tasks = Task.where(:date_task => d2..d1)
		
		tasks.each do |task|
			if task[:task] == 'sent_email' then
				sent_message task
			end
		end	
	end

end
