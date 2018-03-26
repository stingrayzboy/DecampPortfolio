class PortfoliosController < ApplicationController
	access all: [:show, :index], user: {except: [:destroy,:new,:create,:update,:edit,:sort]}, site_admin: :all
	layout "portfolio"

	def index
		@portfolio_items=Portfolio.by_position
	end

	def sort
		params[:order].each do |key,value|
			Portfolio.find(value[:id]).update(position: value[:position])
		end
		render body: nil
	end

	def edit
		@portfolio=Portfolio.find(params[:id])
	end

	def new
		@portfolio=Portfolio.new
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
	      #if Portfolio::save_sexy(@blog)
	      if @blog.save
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
	        format.html { redirect_to portfolios_path, notice: 'Portfolio was successfully updated.' }
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
	    	technologies_attributes:[:id,:name,:_destroy])
    end

end
