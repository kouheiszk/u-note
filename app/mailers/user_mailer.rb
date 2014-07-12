class UserMailer < ActionMailer::Base
  self.default_url_options = { host: APP_CONFIG['site']['host'] }
  include Rails.application.routes.url_helpers

  default from: APP_CONFIG['email']['from']

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.registration_confirmation.subject
  #
  def registration_confirmation(resource)
    @email = resource['email']
    @name = resource['name']

    mail to: @email
  end
end
