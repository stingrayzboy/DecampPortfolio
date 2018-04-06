class PagesController < ApplicationController
  def home
  	@page_title="DevCamp Portfolio | Home Page"
    @title="Home"
  end

  def about
    @title="About"
    @skills=Skill.all
  end

  def contact
    @title="Contact"
  end
  
  def tweets
    @title="Tweets"
  	@tweets=TwitterPateli.twitter_search
  end

end
