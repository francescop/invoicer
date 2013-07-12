class ApplicationController < ActionController::Base
  protect_from_forgery
    
  before_filter :set_locale # get locale directly from the user model

  def set_locale
    I18n.locale = I18n.default_locale
  end
end
