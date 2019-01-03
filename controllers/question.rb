
post '/add_question' do 
    question = Question.new(params)
    question.user_id = current_user.id
    question.save 
    question.errors
    redirect to("/users/#{current_user.id}")
end

get '/question/:id/edit' do
    @question = Question.find(params[:id])
    if current_user && @question.user == current_user
        erb :"edit_question"
    else
        redirect '/'
    end
end

get '/question/:id/delete' do
    @question = Question.find(params[:id])
    if current_user && @question.user == current_user
        erb :"delete_question"
    else
        redirect '/'
    end
end

post '/edit_question/:id' do 
    if current_user
        user_question = Question.find(params[:id])
        user_question.update(question: params[:question])
        redirect to("/users/#{current_user.id}")
    end
end


delete '/delete_question/:id' do 
    p "something"
    if current_user
        user_question = Question.find(params[:id])
        user_question.destroy
        redirect to("/users/#{current_user.id}")
    end
end
