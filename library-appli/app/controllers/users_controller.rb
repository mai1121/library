class UsersController < ApplicationController
	def index
		user = User.find(2)
		@nickname = user.nickname
        @posts = user.posts
	  
	end

end
