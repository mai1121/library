class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :nickname, presence: true, length: { maximum: 25 }
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  has_many :posts
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[google_oauth2]
  # omniauthのコールバック時に呼ばれるメソッド
  def self.from_omniauth(auth)
    user = User.where(email: auth.info.email).first

    user ||= User.create(email: auth.info.email,
                         nickname: auth.info.name,
                         provider: auth.provider,
                         password: Devise.friendly_token[0, 20],
                         uid: auth.uid)
    user
  end
end
