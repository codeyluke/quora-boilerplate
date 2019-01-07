post '/question/:id/answers/add' do 
    answer = Answer.new(answer: params[:answer])
    answer.user_id = current_user.id
    answer.question_id = params[:id]
    answer.save
    answer.errors 
    redirect to("/users/#{current_user.id}")
end

get '/answer/:id/edit' do 
    if current_user
        @answer = Answer.find(params[:id])
        erb :"/answer/edit_answer"
    end
end

get '/answer/:id/delete' do 
    @answer = Answer.find(params[:id])
    erb :"/answer/delete_answer"
end

patch '/edit_answer/:id' do
    user_answer = Answer.find(params[:id])
    user_answer.update(answer: params[:answer])
    redirect to("/users/#{current_user.id}")
end

delete '/delete_answer/:id' do 
    user_answer = Answer.find(params[:id])
    user_answer.destroy
    redirect to("/users/#{current_user.id}")
end
