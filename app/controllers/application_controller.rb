class ApplicationController < ActionController::Base
  require 'geoip'

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def default_url_options(options={})
    { :locale => I18n.locale }
  end

  before_action :set_locale

  def set_locale
    extracted_locale = params[:locale] || extract_locale_from_accept_language_header || extract_locale_from_ip
    I18n.locale = (I18n::available_locales.include? extracted_locale.to_sym) ? extracted_locale : I18n.default_locale
  end

  after_action  :store_location

  def store_location
    if (request.fullpath !~ Regexp.new("\\A/users/sign_in.*\\z") &&
        request.fullpath !~ Regexp.new("\\A/users/sign_up.*\\z") &&
        request.fullpath !~ Regexp.new("\\A/users/password.*\\z") &&
        !request.xhr?)
      session[:previous_url] = request.fullpath
    end
  end

  def after_sign_in_path_for(resource)
    if (session[:previous_url] == root_path)
      super
    else
      session[:previous_url] || root_path
    end
  end

  private
  def extract_locale_from_accept_language_header
    request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
  end

  def extract_locale_from_ip
    geoip ||= GeoIP.new(Rails.root.join('db/GeoIP.dat'))
    country_location = geoip.country(request.remote_ip)
    country_location.country_code2.downcase
  end

end
