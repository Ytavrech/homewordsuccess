class User < ApplicationRecord
  has_secure_password
  # has_many :articles
  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Invalid email' }
  # validates :password, :presence => true,
  #                :confirmation => true,
  #                :length => { minimum: 5 }


  before_create :confirmation_token
  after_create do
    UserMailer.registration_confirmation(self.id).deliver_now
  end

  private

  def confirmation_token
    if self.confirm_token.blank?
        self.confirm_token = SecureRandom.urlsafe_base64.to_s
    end
  end

  def email_activate
    self.email_confirmed = true
    self.confirm_token = nil
    save!(:validate => false)
  end  
end
