class User < ApplicationRecord
    has_secure_password
    # has_many :articles
    validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Invalid email' }
    # validates :password, :presence => true,
    #                :confirmation => true,
    #                :length => { minimum: 5 }
end
