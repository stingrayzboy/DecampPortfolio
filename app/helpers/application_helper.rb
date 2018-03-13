module ApplicationHelper
	def logged_in
		if current_user.is_a?(User)
        (link_to "Log out",destroy_user_session_path,method: :delete).html_safe
    	else
        "#{(link_to "Log in",new_user_session_path).html_safe}<br>#{(link_to "Sign Up!",new_user_registration_path).html_safe}".html_safe
        
    	end
	end


	def session_module layout_name
		if session[:source]

      		greeting="Thanks From Visiting From #{session[:source].inspect}"
      		content_tag :p ,greeting,class:"social-handle"
    	end
	end
end
