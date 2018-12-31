class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :nickname, presence: true
  has_many :posts
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i(google_oauth2)
  # omniauthのコールバック時に呼ばれるメソッド
  def self.from_omniauth(auth)
    user = User.where(email: auth.info.email).first

    unless user
      user = User.create(email: auth.info.email,
        nickname: auth.info.name,
        provider: auth.provider,
        password: Devise.friendly_token[0, 20],
        uid: auth.uid)
    end
    user
    # where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    #   user.email = auth.info.email
    #   user.password = Devise.friendly_token[0,20]
    # end
  end
end
