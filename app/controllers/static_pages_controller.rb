class StaticPagesController < ApplicationController
 

  def home
    if signed_in?
      @product  = current_user.products.build
      @products = Product.all
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def help
  end
end

