module ApplicationHelper
	def logged_in style=nil
		if !(current_user.is_a?(GuestUser))
        (link_to "Log out",destroy_user_session_path,method: :delete,class:style).html_safe
    	else
        "#{(link_to "Log in",new_user_session_path,class:style).html_safe}   #{(link_to "Sign Up!",new_user_registration_path,class:style).html_safe}".html_safe
        
    	end
	end

  def markdown(text)
    options = {
      filter_html:     true,
      hard_wrap:       true,
      link_attributes: { rel: 'nofollow', target: "_blank" },
      space_after_headers: true,
      fenced_code_blocks: true
    }

    extensions = {
      autolink:           true,
      superscript:        true,
      disable_indented_code_blocks: true
    }

    renderer = Redcarpet::Render::HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)

    markdown.render(text).html_safe
  end

  def page_title from
    "Faraz Noor | #{from}"
  end

	def session_module style=nil
		if session[:source]
      		greeting="Thanks From Visiting From #{session[:source].inspect} feel free to #{link_to 'Contact Me',pages_contact_path} if you would like to work together."
      		content_tag :div ,greeting.html_safe,class: style
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
        url: new_home_nav_path("about_click"),
        title: 'About Me',
        post: true
      },
      {
        url: new_home_nav_path("contact_click"),
        title: 'Contact'
      },
      {
        url: new_home_nav_path("skills_click"),
        title: 'Skills'
      },
      {
        url: blogs_path,
        title: 'Blog'
      },
      {
        url: portfolios_path,
        title: 'Portfolio'
       }#,
      # {
      #   url: pages_tweets_path,
      #   title: 'Tweets'
      # }
    ]
  end

  def nav_helper style, tag_start=nil, tag_end=nil
    nav_links = ''

    nav_items.each do |item|
      nav_links << "#{tag_start}<a href='#{item[:url]}' class='#{style} #{active? item[:url]}'  #{"method=post" if item[:post]}>#{item[:title]}</a>#{tag_end}"
    end

    nav_links.html_safe
  end

  def active? path
    "active" if current_page? path
  end

  def alerts message=nil
    if message
      return js add_gritter(message,sticky:false)
    end
    alert=(flash[:alert]||flash[:notice]||flash[:error])
    if alert
      js add_gritter(alert, sticky:false,time:2000)
    end
  end

end
