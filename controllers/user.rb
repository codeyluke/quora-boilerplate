get '/signup' do 
    erb :"user/sign_up"
end

get '/login' do 
    erb :"user/login"
end

get '/profile' do 
    erb :"user/profile_page"
end

get '/users/:id' do
    @user = User.find(params[:id])
    @questions = Question.where(user_id: params[:id])
    @all_questions = Question.all
    @all_answers = Answer.all
    erb :"user/profile_page"
end

get '/login_fail' do 
    erb :"user/login_fail"
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
        # session[:user_id] = user.id
        sign_in(user)
        redirect to("/users/#{user.id}")
    else 
        redirect to("/login_fail")
    end
end

post '/logout' do 
    # session[:user_id] = nil
    sign_out
    redirect to("/")
end