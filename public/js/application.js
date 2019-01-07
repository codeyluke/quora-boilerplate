$('.btn-vote-up').click(
    function(event){
        event.preventDefault();
        let current_id = event.target.value;
        console.log(current_id)  
        $.ajax({
            method: "POST",
            url: `/vote/${current_id}/add`,
            dataType: "JSON",
            success: function(data){
                if(data.message == "Successful"){
                    $(`.current-votes-${current_id}`).html(`Answer Votes - ${data.new_count}`);
                } else if (data.message == "Failed") {
                    alert('You have voted!')
                } 
            }
        });
    }
);

$('.btn-vote-remove').click(
    function(event){
        event.preventDefault();
        let current_id = event.target.value;
        console.log(current_id)
        $.ajax({
            method: "DELETE",
            url: `/vote/${current_id}/delete`,
            dataType: "JSON",
            success: function(data){
                if(data.message == "message_deleted"){
                    $(`.current-votes-${current_id}`).html(`Answer Votes - ${data.new_count}`);
                }
            }
        })
    }
)
