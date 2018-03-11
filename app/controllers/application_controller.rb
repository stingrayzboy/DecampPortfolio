class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  include DeviseWhitelist
  include SessionSetting
  include CurrentUserConcern
end
