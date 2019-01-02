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
    @questions = Question.where(user_id: params[:id])
    erb :"profile_page"
end

get '/login_fail' do 
    erb :"login_fail"
end

post "/signup" do
    user = User.new(params)
    if user.save
        redirect to("/login")
    else
        redirect to("/signup")
    end
end 

post '/login' do
    user = User.find_by(email: params[:email])

    # byebug
    if user && user.authenticate(params[:password])
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