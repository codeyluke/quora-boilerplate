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
        redirect to("/users/#{current_user.id}")
    else 
        redirect to("/users/#{current_user.id}")
    end

end