post '/vote/:id/add' do 
    Vote.create(answer_id: params[:id], user_id: current_user.id)
    redirect to("/users/#{current_user.id}")
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