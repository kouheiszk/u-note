class ApplicationController < ActionController::Base
  require 'geoip'

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_locale

  def default_url_options(options={})
    { :locale => I18n.locale }
  end

  def set_locale
    extracted_locale = params[:locale] || extract_locale_from_accept_language_header || extract_locale_from_ip
    I18n.locale = (I18n::available_locales.include? extracted_locale.to_sym) ? extracted_locale : I18n.default_locale
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
