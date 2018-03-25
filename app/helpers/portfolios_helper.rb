module PortfoliosHelper


def image_generator(height,width)
	"http://via.placeholder.com/#{height}x#{width}"
end

def portfolio_img img,style
	
	if img.model.main_image? || img.model.thumb_image?
		img
	elsif style=="thumb"
		image_generator(350,200)
	elsif style=="main"
		image_generator(600,400)		
	end
end

end