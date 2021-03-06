class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, :omniauthable

  has_many :events

  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first
 
    unless user
      user = User.create(
        uid:      auth.uid,
        provider: auth.provider,
        email:    User.dummy_email(auth),
        password: Devise.friendly_token[0, 20],
        username: auth.info.name
      )
    end
 
    user
  end

  def self.search(search)
    if search
      User.where(['username LIKE ?', "%#{search}%"])
    else
      User.all
    end
  end

 
  private
 
  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end


end
