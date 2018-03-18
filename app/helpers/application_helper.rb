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
  
  def nav_items
    [
      {
        url: root_path,
        title: 'Home'
      },
      {
        url: pages_about_path,
        title: 'About Me'
      },
      {
        url: pages_contact_path,
        title: 'Contact'
      },
      {
        url: blogs_path,
        title: 'Blog'
      },
      {
        url: portfolios_path,
        title: 'Portfolio'
      },
    ]
  end

  def nav_helper style, tag_start=nil, tag_end=nil
    nav_links = ''

    nav_items.each do |item|
      nav_links << "#{tag_start}<a href='#{item[:url]}' class='#{style} #{active? item[:url]}'>#{item[:title]}</a>#{tag_end}"
    end

    nav_links.html_safe
  end

  def active? path
    "active" if current_page? path
  end
end
