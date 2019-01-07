post '/vote/:id/add' do 
    vote = Vote.new(answer_id: params[:id], user_id: current_user.id)
    if vote.save
        answer = Answer.find(params[:id])
        new_count = answer.votes.count
        return {message: "Successful",new_count: new_count}.to_json
    else
        {message: "Failed"}.to_json
    end
end 

delete '/vote/:id/delete' do 
    user_vote = Vote.find_by(answer_id: params[:id], user_id: current_user.id)
    if user_vote 
        user_vote.destroy
        answer = Answer.find(params[:id])
        new_count = answer.votes.count
        # redirect to("/users/#{current_user.id}")
        return {message: "message_deleted", new_count: new_count}.to_json
    else 
        # redirect to("/users/#{current_user.id}")
        return {message: "invalid_user"}.to_json
    end

end