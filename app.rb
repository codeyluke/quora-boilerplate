require_relative './config/init.rb'
set :run, true


get '/' do
  erb :"user/home"
end