post '/question/:id/answers/add' do 
    answer = Answer.new(answer: params[:answer])
    answer.user_id = current_user.id
    answer.question_id = params[:id]
    answer.save
    answer.errors 
    redirect to("/users/#{current_user.id}")
end


