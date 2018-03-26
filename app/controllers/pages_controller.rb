class PagesController < ApplicationController
  def home
  	@page_title="DevCamp Portfolio | Home Page"
  end

  def about
  end

  def contact
  end
  
  def tweets
  	@tweets=TwitterPateli.twitter_search
  end

end
