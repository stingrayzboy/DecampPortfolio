module CurrentUserConcern
	extend ActiveSupport::Concern

	def current_user
	  	super||OpenStruct.new(name:"Guest Guest",first_name:"Guest",last_name:"Guest",email:"guest@guest.com")
	end
end