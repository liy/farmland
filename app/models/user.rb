class User < ActiveRecord::Base
  has_secure_password

  attr_accessible :email, :name, :password, :password_reset_token

  # validate email
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, :presence => true,
            :format => { :with => email_regex },
            :uniqueness => { :case_sensitive => false }

  # make sure the name and password exist
  validates_presence_of :password
  validates_presence_of :name

  has_many :guidances, dependent: :destroy
  has_many :farmers, through: :guidances

  # generate a unique authenticate token for remember me feature.
  before_create { generate_token(:auth_token) }

  # this generate a unique random token
  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

  def send_registration_confirmation
    generate_token(:activation_token)
    # Although we only update the activation token, the validation will be processed by default
    # in order to save it correctly, we have to ignore validation
    save! :validate => false
    UserMailer.registration_confirmation(self).deliver
  end

  # generate token and send out the email
  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    # Although we only update the reset token, the validation will be processed by default
    # in order to save it correctly, we have to ignore validation
    save! :validate => false
    UserMailer.password_reset(self).deliver
  end

  def activated?
    self.activation_token.nil?
  end

  def activate
    # nil the token, indicate this account is activated
    self.activation_token = nil

    save! :validate => false
  end
end