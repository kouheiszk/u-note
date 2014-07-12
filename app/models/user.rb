class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :omniauthable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  # TwitterでのOAuth認証の場合、
  # ダミー用の一意でかつ通常ありえないEmailアドレスをランダムに生成して、
  # usersテーブルのemailカラムに格納し、
  # OAuth認証によるセッション開始時に格納する。
  #
  # FacebookでのOAuth認証の場合に取得したEmailアドレスが、
  # 通常フォームからのユーザー登録によりすでにレコードに存在している場合は、
  # FacebookでのOAuth認証を許可しない。
  # 逆に、通常フォームからのサインアップ時のEmailアドレスが、
  # FacebookでのOAuth認証によりすでにレコードに存在している場合は、
  # 通常フォームからのサインアップを許可しない。
  #
  # @see http://easyramble.com/implement-devise-and-ominiauth-on-rails.html

  def self.find_for_facebook_oauth(auth, signed_in_resource = nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.create(name:     auth.extra.raw_info.name,
                         provider: auth.provider,
                         uid:      auth.uid,
                         email:    auth.info.email,
                         password: Devise.friendly_token[0, 20]
                        )
    end
    user
  end

  def self.find_for_twitter_oauth(auth, signed_in_resource = nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.create(name:     auth.info.nickname,
                         provider: auth.provider,
                         uid:      auth.uid,
                         email:    User.create_unique_email,
                         password: Devise.friendly_token[0, 20]
                        )
    end
    user
  end

  # 通常サインアップ時のuid用、Twitter OAuth認証時のemail用にuuidな文字列を生成
  def self.create_unique_string
    SecureRandom.uuid
  end

  # twitterではemailを取得できないので、適当に一意のemailを生成
  def self.create_unique_email
    User.create_unique_string + "@example.com"
  end

  # allow users to update their accounts without passwords
  def update_without_current_password(params, *options)
    params.delete(:current_password)

    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end
end
