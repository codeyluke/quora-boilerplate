require 'uri'
require_relative '../config/init.rb'
enable :sessions

class User < ActiveRecord::Base
    validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP } 
    validates :password, presence: true, length: {minimum: 6}
    has_secure_password
    has_many :questions
end 
 
get '/login_fail' do 
    erb :"login_fail"
end
  
post "/signup" do
    user = User.new(params[:user])
    if user.save
        redirect to("/login")
    else
        redirect to("/signup")
    end
end 
   
post '/login' do
    user = User.find_by(email: params[:user][:email])

    # byebug
    if user && user.authenticate(params[:user][:password])
        # session[:signed_in] = true
        session[:user_id] = user.id
        redirect to("/users/#{user.id}")
    else 
        redirect to("/login_fail")
    end
end

post '/logout' do 
    session[:user_id] = nil 
    redirect to("/")
end