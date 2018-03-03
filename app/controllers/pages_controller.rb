class PagesController < ApplicationController
  def home
  	@pages = Blog.all
  	@skills = Skill.all
  end

  def about
  end

  def contact
  end
end
