module DynamicTitle
	extend ActiveSupport::Concern
	included do
		before_action :set_title
	end
  def set_title
  	@page_title="DevCamp Portfolio | My Portfolio Site"
  end
end