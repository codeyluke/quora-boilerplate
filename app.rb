require_relative './config/init.rb'
enable :sessions
set :run, true

get '/' do
  erb :"home"
end

get '/login_success' do 
  erb :"login_success"
end

get '/login_fail' do 
  erb :"login_fail"
end

# In app.rb
post "/signup" do
  user = User.new(params[:user])
  if user.save
    # what should happen if the user is saved?
    redirect to("/")
  else
    # what should happen if the user keyed in invalid date?
    redirect to("/signup")
  end
end 


post '/login' do
  # apply a authentication method to check if a user has entered a valid email and password
  # if a user has successfully been authenticated, you can assign the current user id to a session
  user = User.find_by(email: params[:user][:email])
  if user && user.authenticate(params[:user][:password])
    session[:signed_in] = true
    session[:user] = user
    redirect to("/login_success")
  else 
    redirect to("/login_fail")
  end
end

post '/logout' do 
  session[:signed_in] = false 
  p "hello"
  redirect to("/")
end