$('.btn-vote-up').click(
    function(event){
        event.preventDefault();
        let current_id = event.target.value;
            
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

