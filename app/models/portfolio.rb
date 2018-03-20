class Portfolio < ApplicationRecord
	has_many :technologies,dependent: :destroy
	accepts_nested_attributes_for :technologies,
									reject_if: lambda {|attrs| attrs["name"].blank?}
	include Placeholder
	validates_presence_of :title,:body,:main_image,:thumb_image
	
	def self.angular
		where(subtitle:"Angular")
	end

	scope :ruby_on_rails, -> {where(subtitle:"Ruby on Rails")}

	after_initialize :set_defaults

	def set_defaults
	
		self.main_image||=Placeholder.image_generator(600,400)
		self.thumb_image||=Placeholder.image_generator(350,200)
	end

	def self.save_sexy(blog)
		
		attribs2=[]
		@blog_technologies=blog.technologies.first.name.split(',')
		@blog_technologies.each do |b|

			attribs2<<{name:b}
		end
		@blog2=Portfolio.new
		@blog2.title=blog.title
		@blog2.body=blog.body
		@blog2.subtitle=blog.subtitle
		#byebug
		@blog2.technologies_attributes=attribs2
		blog.destroy
		return @blog2.save
	end
	def self.by_position
		order("position ASC")
	end
	
end
