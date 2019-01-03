class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @nickname = @user.nickname
    @posts = @user.posts
    # 楽天より書籍情報を検索
    # # タイトルの配列を引数にして検索メソッドを呼び出し
    @items = search_rakuten_api(@posts)
  end

  def search_rakuten_api(keywords)
    # 検索結果格納する空の配列を定義
    search_items = []
    keywords.each do |keyword|
      item = RakutenWebService::Books::Book.search(title: keyword[:title], author: keyword[:author]).first
      if item.nil?
        item_image = ""
        item_url = ""
      else
        item_image = item['mediumImageUrl']
        item_url = item['itemUrl']
      end
      search_items << { image: item_image, url: item_url }
    end

    # 配列を返す
    search_items
  end
end
