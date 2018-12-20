class PostsController < ApplicationController
	def index
		
	end
	def new
		@post = Post.new
	end
	def create
		
		Post.create(post_params)
		redirect_to controller: :users, action: :index
	end
	def update
	end

	# ストロングパラメータを設定
	 def post_params
	 	binding.pry
	    params.require(:post).permit(:title, :author, :quote, :comment).merge(user_id: current_user.id)
	 end
end
