post '/vote/:id/add' do 
    Vote.create(answer_id: params[:id], user_id: current_user.id)
    redirect to("/users/#{current_user.id}")
end 