class PagesController < ApplicationController
  def home
  	@pages = Blog.all
  end

  def about
  end

  def contact
  end
end
