require_relative './config/init.rb'
set :run, true

get '/' do
  @name = "Bob Smith"
  erb :"home"
end

# In app.rb
post '/signup' do
  user = User.new(params[:user])
  if user.save
    # what should happen if the user is saved?
    puts "User is saved"
  else
    # what should happen if the user keyed in invalid date?
    puts "Invalid"
  end
end 