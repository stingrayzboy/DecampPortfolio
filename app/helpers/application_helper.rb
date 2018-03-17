module ApplicationHelper
	def logged_in style=nil
		if !(current_user.is_a?(GuestUser))
        (link_to "Log out",destroy_user_session_path,method: :delete,class:style).html_safe
    	else
        "#{(link_to "Log in",new_user_session_path,class:style).html_safe}   #{(link_to "Sign Up!",new_user_registration_path,class:style).html_safe}".html_safe
        
    	end
	end


	def session_module layout_name=nil
		if session[:source]

      		greeting="Thanks From Visiting From #{session[:source].inspect}"
      		content_tag :p ,greeting,class:"social-handle"
    	end
	end
  def set_copyright
    Platipus::Renderer.copyright "Faraz Noor","All rights Reserved"
  end
end
