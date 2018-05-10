class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :cameras

  after_create :send_signup_email
  def send_signup_email
    UserNotifier.send_signup_email(self).deliver
  end
end
