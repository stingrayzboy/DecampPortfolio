class Skill < ApplicationRecord
	include Placeholder
	validates_presence_of :title,:percent_utilized

	after_initialize :set_defaults

	def set_defaults
		self.badge||=Placeholder.image_generator(250,250)
		
	end
end
