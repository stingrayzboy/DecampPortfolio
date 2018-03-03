class PortfoliosController < ApplicationController
	def index
		@portfolio_items=Portfolio.all	
	end

	def new
	end

	
	def create
    @blog = Portfolio.new(params.require(:portfolio).permit(:title, :body,:thumb_image,:main_image,:subtitle))

    respond_to do |format|
      if @blog.save
        format.html { redirect_to portfolios_path, notice: 'Blog was successfully created.' }
        format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new }
        format.json { render json: @portfolio.errors, status: :unprocessable_entity }
      end
    end
  

	end
end
