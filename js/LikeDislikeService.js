
 datahandlerApp.service('LikeDislikeService', function($rootScope) {

    this.likeDislikeMap = {};
    this.syncDataset = function(review_id)
    {

        var self = this;
        var data = self.likeDislikeMap[review_id];    
        return data;
       
    }

    this.clean = function()
    {
        var self = this;
        self.likeDislikeMap = {};
    }

    this.saveUserAction = function(review_id,isLike,user_id)
    {
        var self = this;
            var user_action = 'D';
            if(isLike)
            {
                user_action = 'L';
            }

            var formData = {

                    review_id         : review_id,
                    user_id           : user_id,
                    user_action       : user_action
             };
            
            console.log(formData);

              // process the formf
            $.ajax({
                type        : 'POST', // define the type of HTTP verb we want to use (POST for our form)
                url         : 'api/save_data/save_review_action.php', // the url where we want to POST
                data        : formData, // our data object
                dataType    : 'json', // what type of data do we expect back from the server
                encode          : true
            })
                // using the done promise callback
            .done(function(data) {
                
                // log data to the console so we can see
                console.log(data); 
               

                 var d = new Object();
                 d.totalLike = data['total_liked'];
                 d.totalDislike = data['total_disliked']; 
                 self.likeDislikeMap[review_id] = d;
                 console.log(self.likeDislikeMap);
                $rootScope.$broadcast('eventUserActionSaveComplete',review_id);   

                // here we will handle errors and validation messages
            }).fail(function( xhr, status, errorThrown ) {
                    alert( "Sorry, there was a problem!" );
                    console.log( "Error: " + errorThrown );
                    console.log( "Status: " + status );
                    console.dir( xhr );
            });

    }


 });