class PostsController < ApplicationController
	def index
	end
	def show
	
	end

	def edit
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end
	def create
		
		post = Post.create(post_params)
		# binding.pry
		redirect_to controller: :users, action: :index
	end
	def update
	end

	
	# ストロングパラメータを設定
	 def post_params
	 	
	    params.require(:post).permit(:title, :author, :quote, :comment).merge(user_id: current_user.id)
	 end


	
end
