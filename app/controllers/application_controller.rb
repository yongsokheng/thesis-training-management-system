class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!, :set_locale

  include ApplicationHelper
  include PublicActivity::StoreController

  rescue_from CanCan::AccessDenied do |exception|
    flash[:alert] = exception.message
    redirect_to main_app.root_path
  end

  def default_url_options options = {}
    {locale: I18n.locale}
  end

  private
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
end
