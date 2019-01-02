get '/signup' do 
    erb :"sign_up"
end

get '/login' do 
    erb :"login"
end

get '/profile' do 
    erb :"profile_page"
end

get '/users/:id' do
    @user = User.find(params[:id])
    erb :"profile_page"
end