class PortfoliosController < ApplicationController
	layout "portfolio"
	def index
		@portfolio_items=Portfolio.all
	end

	def edit
		@portfolio=Portfolio.find(params[:id])

	end

	def new
		@portfolio=Portfolio.new
		1.times {@portfolio.technologies.build}
	end
	
	def show
		@portfolio=Portfolio.find(params[:id])
	end

	def destroy
    	@portfolio=Portfolio.find(params[:id])
    	@portfolio.destroy
    	redirect_to portfolios_path
    end

	def create
	    @blog = Portfolio.new(portfolio_params)
	    #byebug

	    respond_to do |format|
	      if Portfolio::save_sexy(@blog)
	      #if @blog.save
	        format.html { redirect_to portfolios_path, notice: 'Portfolio was successfully created.' }
	        format.json { render :show, status: :created, location: @blog }
	      else
	        format.html { render :new }
	        format.json { render json: @portfolio.errors, status: :unprocessable_entity }
	      end
	    end  
    end
  
    def update
    	@portfolio=Portfolio.find(params[:id])
    	respond_to do |format|
	      if @portfolio.update(portfolio_params)
	        format.html { redirect_to portfolios_path, notice: 'Blog was successfully updated.' }
	        format.json { render :show, status: :ok, location: @blog }
	      else
	        format.html { render :edit }
	        format.json { render json: @blog.errors, status: :unprocessable_entity }
	      end
    	end
    end

    private 
    
    def portfolio_params
    	params.require(:portfolio).permit(:title, :body,:thumb_image,:main_image,:subtitle,
	    	technologies_attributes:[:name])
    end

end
