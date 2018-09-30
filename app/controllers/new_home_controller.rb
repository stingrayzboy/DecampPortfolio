class NewHomeController < ApplicationController
	layout "new_application"
	def index
		@title="Home"
		@title="About"
		@skills=Skill.all
		@title="Contact"
		@title="Tweets"
		#@tweets=TwitterPateli.twitter_search
	end
end
