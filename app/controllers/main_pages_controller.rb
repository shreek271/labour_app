class MainPagesController < ApplicationController
  
  def home
  	if logged_in?
    @micropost  = current_customer.microposts.build
    @feed_items = current_customer.feed
  end

  end

  def about
  end

  def help
  end

  def contact
  end

end
