class Question < ActiveRecord::Base
    belongs_to :user
end 

post '/add_question' do 
    question = Question.new(params)
    question.user_id = current_user.id
    question.save 
    question.errors
    # if question.save
    #     redirect to("")
    # end
    redirect to("/users/#{current_user.id}")
end