class UsersController < ApplicationController
	def index
	  	@users = User.all
	end
	def show
		user = User.find(params[:id])
		@nickname = user.nickname
        @posts = user.posts
        # 楽天より書籍情報を検索
        # ユーザーの投稿のタイトルを配列形式で格納
        # keywords = user.posts.title
        # # タイトルの配列を引数にして検索メソッドを呼び出し
        # @items = search_rakuten_api(keywords)  
	end


	# def search_rakuten_api(keywords)
	# 	# 検索結果格納する空の配列を定義
	# 	search_items = []
	# 	keywords.each do |keyword|
	# 		item = RakutenWebService::Ichiba::Item.search(keyword: keyword).first
	# 		search_items << item
	# 	end
	# 	# 配列を返す
	# 	return search_items
	# end

end
