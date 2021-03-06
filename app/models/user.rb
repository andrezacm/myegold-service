class User < ActiveRecord::Base

	def self.from_omniauth(auth)
		create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      if auth['info']
        user.name = auth['info']['name'] || ""
        user.email = auth['info']['email']
      end
    end
  end

	def set_username_and_password username, password
		self.username = username
		self.psw = password
	end

end
