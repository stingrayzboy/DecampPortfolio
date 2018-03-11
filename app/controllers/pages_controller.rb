class PagesController < ApplicationController
  def home
  	@page_title="DevCamp Portfolio | Home Page"
  	@pages = Blog.all
  	@skills = Skill.all
  end

  def about
  end

  def contact
  end
end
