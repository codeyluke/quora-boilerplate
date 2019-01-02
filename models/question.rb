class Question < ActiveRecord::Base
    belongs_to :user
end 

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

post '/update_question/:id' do 
    if current_user
        user_question = Question.find(params[:id])
        user_question.update(question: params[:question])
        redirect to("/users/#{current_user.id}")
    end
end