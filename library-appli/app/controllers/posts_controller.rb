class PostsController < ApplicationController
	def index
		# @items = RakutenWebService::Ichiba::Item.search(keyword: "海辺のカフカ 村上春樹 ")
	  # images_arr = []
	  # items.each do |item|

	  # # したい処理
	  # @title = item['itemName'] #商品名
	  # @price = item['itemPrice'] #価格
	  # @url = item['itemUrl'] #商品のURL
	  # @image = item['smallImageUrl']
	  # end
	end
	def show

		
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
