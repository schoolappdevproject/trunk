
 datahandlerApp.service('SaveCommentService', function($rootScope) {

    this.user_id = "";
    this.review_id = "";
    this.comment = "";

    this.saveComment = function(user_id,review_id,comment)
    {

             var formData = {
                user_id       : user_id,
                review_id     : review_id,
                comment       : comment
            };

            //  console.log(formData);

            // process the formf
            $.ajax({
                type        : 'POST', // define the type of HTTP verb we want to use (POST for our form)
                url         : 'api/save_data/save_comments.php', // the url where we want to POST
                data        : formData, // our data object
                dataType    : 'json', // what type of data do we expect back from the server
                encode          : true
            })
                // using the done promise callback
            .done(function(data) {    

                success = data['success'];
                if(success == "0")
                {
                    console.log("Review comment saved successfully");

                }
                else 
                {
                    reason = data['reason'];
                    console.log("Reason"+ reason);
                }
            

                // here we will handle errors and validation messages
            }).fail(function( xhr, status, errorThrown ) {
                    alert( "Sorry, there was a problem!" );
                    console.log( "Error: " + errorThrown );
                    console.log( "Status: " + status );
                    console.dir( xhr );
            });

                    
    }


 });