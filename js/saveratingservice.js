   datahandlerApp.service('SaveRatingService', function($rootScope) {


             this.generalRatingDatabase = [];
             this.syncDataset = function($scope)
            {
                var self = this;             
                $scope.generalRatingDatabase = self.generalRatingDatabase;
            }
            this.saveRating = function($scope)
            {
                var self = this;
                
                var formData = {
                    id_school      : $scope.ID,
                    user_id        : $scope.user_id,
                    rating_heading : $scope.rating_heading,
                    rating_desc    : $scope.rating_text,
                    rating_value   : $scope.rating_value
                };
   
                $.ajax({
                    type        : 'POST', // define the type of HTTP verb we want to use (POST for our form)
                    url         : 'api/save_data/save_rating.php', // the url where we want to POST
                    data        : formData, // our data object
                    dataType    : 'json', // what type of data do we expect back from the server
                    encode          : true
                })
                    // using the done promise callback
                .done(function(data) {    

                    if(data['success'] == "1")
                    {
                        console.log("Successfully saved rating");
                    }
                    else if (data["success"] == "0")
                    {
                        console.log("Some Problem in saving rating ");
                        console.log(data["error"]);
                    }
                    $rootScope.$broadcast('eventOnRatingSaveComplete');  
                    // here we will handle errors and validation messages
                }).fail(function( xhr, status, errorThrown ) {
                        alert( "Sorry, there was a problem!" );
                        console.log( "Error: " + errorThrown );
                        console.log( "Status: " + status );
                        console.dir( xhr );
                });

            }

            this.loadSchoolRatings = function(school_id)
            {

               
                console.log(school_id);
                var self = this;

                self.generalRatingDatabase = [];
                var formData = {
                        id_school     : school_id
                };

                // console.log(formData);

                // process the formf
                $.ajax({
                    type        : 'POST', // define the type of HTTP verb we want to use (POST for our form)
                    url         : 'api/load_data/load_gen_rating.php', // the url where we want to POST
                    data        : formData, // our data object
                    dataType    : 'json', // what type of data do we expect back from the server
                    encode          : true
                })
                    // using the done promise callback
                .done(function(data) {

                        for(review_i in data)
                        {
                           self.generalRatingDatabase.push(data[review_i]);
                        }

                         $rootScope.$broadcast('eventOnLoadingRatingComplete');  
                    // here we will handle errors and validation messages
                }).fail(function( xhr, status, errorThrown ) {
                        console.log( "Query Failed" );
                        console.log( "Error: " + errorThrown );
                        console.log( "Status: " + status );
                        console.dir( xhr );
                        return false;
                });
            }

   });