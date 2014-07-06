class Users::RegistrationsController < Devise::RegistrationsController

  def create
    super
    UserMailer.registration_confirmation(resource).deliver unless resource.invalid?
  end

  def build_resource(hash=nil)
    hash[:uid] = User.create_unique_string
    super
  end

end
