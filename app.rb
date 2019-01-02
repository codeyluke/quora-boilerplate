require_relative './config/init.rb'
set :run, true

get '/' do
  erb :"home"
end
