class UsersController < ApplicationController
	def index
	  @items = RakutenWebService::Ichiba::Item.search(keyword: "海辺のカフカ 村上春樹 ")
	  # images_arr = []
	  # items.each do |item|

	  # # したい処理
	  # @title = item['itemName'] #商品名
	  # @price = item['itemPrice'] #価格
	  # @url = item['itemUrl'] #商品のURL
	  # @image = item['smallImageUrl']
	  # end
	end

	

end
