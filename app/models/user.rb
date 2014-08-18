class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  if Rails.env.production?
    devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable
  else
    devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable, :registerable 
  end

  has_many :posts, inverse_of: :user

  # New attributes' validations
  validates :username, :gender, presence: true
  validates :username, uniqueness: { case_sensitive: false }
  validates :gender, inclusion: { in: %w(male female), message: "%{value} is not a valid gender" }

  # Allows to use the 'login' variable some where else in the code 
  def login=(login)
    @login = login
  end

  def login
    @login || self.username || self.email
  end

  # Overwrites Devise's find_for_database_authentication method in User model
  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end
end
