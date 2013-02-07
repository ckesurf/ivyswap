class StaticPagesController < ApplicationController
  
  def home
  	if signed_in ?
  	  @product = current_user.product.all
	  @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def help
  end
end

