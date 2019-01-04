require 'uri'
require_relative '../config/init.rb'
enable :sessions

class User < ActiveRecord::Base
    validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP } 
    validates :password, presence: true, length: {minimum: 6}
    has_secure_password
    has_many :questions
    has_many :answers
    has_many :votes
end 
 

  

   


