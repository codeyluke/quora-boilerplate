require 'uri'

class User < ActiveRecord::Base
    validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP } 
    validates :password, presence: true, length: {minimum: 6}
    has_secure_password
end 

