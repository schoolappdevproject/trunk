                //MAP Service
                datahandlerApp.service('Map', function($q) {

                    this.markers = [];
                    
                    this.init = function() {

                        if(google)
                        {
                            var options = {
                                center: new google.maps.LatLng(20.5937, 78.9629),
                                zoom: 4,
                                disableDefaultUI: true    
                            }
                            this.map = new google.maps.Map(
                                document.getElementById("area_map"), options
                            );
                            this.places = new google.maps.places.PlacesService(this.map);
                        }
                    }

                    this.searchLatLng = function(str,latlng){
                       // console.log("Str"+str);
                       // console.log("location"+latlng);

                        var d = $q.defer();
                        this.places.textSearch({query: str,location:latlng,radius:0}, function(results, status) {
                            if (status == 'OK') {
                                console.log("search success");  
                                d.resolve(results[0]);
                            }
                            else d.reject(status);
                        });
                        return d.promise;
                    }
                    
                    this.search = function(str) {

                       // console.log(str);
                        var d = $q.defer();
                        this.places.textSearch({query: str}, function(results, status) {
                            if (status == 'OK') {
                                console.log("search success");
                               
                                d.resolve(results[0]);
                            }
                            else d.reject(status);
                        });
                        return d.promise;
                    }
                    
                    this.addMarker = function(res) {

                        if(google)
                        {
                            if(marker) marker.setMap(null);
                            var marker = new google.maps.Marker({
                                map: this.map,
                                position: res.geometry.location,
                                animation: google.maps.Animation.DROP
                            });
                            this.map.setCenter(res.geometry.location);
                            this.map.setZoom(13);
                        
                            google.maps.event.addListener(marker, 'click', function() {

                                var infoWindow = new google.maps.InfoWindow();
                                infoWindow.setContent('<div><strong>' + res.name + '</strong><br>' +
                                res.formatted_address + '</div>');
                                infoWindow.open(this.map, marker);
                            });

                            this.markers.push(marker);
                        }

                    }
                    
                     this.addMarkerLocation = function(location,name,address) {

                         if(google)
                         {
                                if(marker) marker.setMap(null);
                            var marker = new google.maps.Marker({
                                map: this.map,
                                position: location,
                                animation: google.maps.Animation.DROP
                            });
                            this.map.setCenter(location);
                            google.maps.event.addListener(marker, 'click', function() {

                                var infoWindow = new google.maps.InfoWindow();
                                infoWindow.setContent('<div><strong>' + name + '</strong><br>' +
                                address + '</div>');
                                infoWindow.open(this.map, marker);
                            });

                            this.markers.push(marker);

                            console.log("Add Marker location"+ location);
                         }
                            
                    }


                    this.setMapOnAll = function(map) {
                        for (var i = 0; i < this.markers.length; i++) {
                           this.markers[i].setMap(map);
                        }
                    }

                    // Removes the markers from the map, but keeps them in the array.
                    this.clearMarkers = function() {
                        this.setMapOnAll(null);
                    }

                    // Shows any markers currently in the array.
                    this.showMarkers = function() {
                        this.setMapOnAll(this.map);
                    }

                    // Deletes all markers in the array by removing references to them.
                    this.deleteMarkers = function() {
                        this.clearMarkers();
                        this.markers = [];
                    }
                });


            datahandlerApp.service('SaveReviewService', function($rootScope) {


                    this.fileUploadCount = 0; 
                    this.imageUploadCount = 0;
                    this.totalImages = -1;
                    this.totalFiles = -1;

                    this.reviewPicArray = [];
                    this.filesUploadedList = [];

                    this.onUpload = function(type)
                    {
                      //  console.log(type);
                        var self = this;
                        if(type =="file")
                        {
                            self.fileUploadCount ++;
                        }
                        else if(type == "img")
                        {
                            self.imageUploadCount ++;
                        }

                     //   console.log(self.fileUploadCount);
                      //  console.log(self.imageUploadCount);
                      //  console.log(self.filesUploadedList.length);
                       // console.log(self.reviewPicArray.length);

                        if((self.fileUploadCount == self.totalFiles)  && 
                                (self.imageUploadCount == self.totalImages))
                        {   
                           // console.log("Review Save complete");
                            $rootScope.$broadcast('eventOnReviewSaveComplete');   
                        }
                        else if ( self.totalFiles == 0 &&  (self.imageUploadCount == self.totalImages)) //there are no file but images 
                        {
                            //console.log("Review Save complete");
                            $rootScope.$broadcast('eventOnReviewSaveComplete');   
                        }
                        else if (self.totalImages == 0 && (self.fileUploadCount == self.totalFiles))
                        {
                            //console.log("Review Save complete");
                            $rootScope.$broadcast('eventOnReviewSaveComplete');   
                        }
                        else if( (self.totalFiles == 0) && (self.totalImages == 0) )
                        {
                            //console.log("Review Save complete");
                            $rootScope.$broadcast('eventOnReviewSaveComplete');   
                        }
                    }

                    this.saveReview = function($scope)
                    {
                        var self = this;
                        
                        self.fileUploadCount = 0; 
                        self.imageUploadCount = 0;

                        self.reviewPicArray = $scope.reviewPicArray;
                        self.filesUploadedList = $scope.filesUploadedList;

                        self.totalFiles = self.filesUploadedList.length;
                        self.totalImages = self.reviewPicArray.length;

                        var formData = {
                            id_school     : $scope.ID,
                            user_id       : $scope.user_id,
                            title         : $scope.review_heading,
                            review_text   : $scope.review_text
                        };

                      //  console.log(formData);

                        // process the formf
                        $.ajax({
                            type        : 'POST', // define the type of HTTP verb we want to use (POST for our form)
                            url         : 'api/save_data/save_review_comments.php', // the url where we want to POST
                            data        : formData, // our data object
                            dataType    : 'json', // what type of data do we expect back from the server
                            encode          : true
                        })
                            // using the done promise callback
                        .done(function(data) {    

                            review_id = data['review_id'];
                          //  console.log("Review ID" + review_id); 
                            if(self.totalImages > 0)
                            {
                                self.saveImages(review_id);
                            }

                            if(self.totalFiles > 0)
                            {
                                self.saveFiles(review_id);
                            }

                            if(self.totalFiles == 0  && self.totalImages == 0)
                            {
                                self.onUpload("x");
                            }

                            // here we will handle errors and validation messages
                        }).fail(function( xhr, status, errorThrown ) {
                                alert( "Sorry, there was a problem!" );
                                console.log( "Error: " + errorThrown );
                                console.log( "Status: " + status );
                                console.dir( xhr );
                        });

                    }

                    this.saveImages = function (review_id)
                    {
                      
                      var self = this;
                        var _inc = 1;
                        for(pic in self.reviewPicArray)
                        {

                            var formData = {

                                    picName           : "pic_"+review_id+"_"+_inc,
                                    picData           : self.reviewPicArray[pic].picData,
                                    review_id         : review_id,
                                    type              :"jpg"
                            };

                            // process the form
                            $.ajax({
                                type        : 'POST', // define the type of HTTP verb we want to use (POST for our form)
                                url         : 'api/image_upload/attach_pic.php', // the url where we want to POST
                                data        : formData, // our data object
                                dataType    : 'json', // what type of data do we expect back from the server
                                encode          : true
                            })
                                // using the done promise callback
                            .done(function(data) {

                                // log data to the console so we can see
                               // console.log(data['code']);    
                                //console.log("file "+formData.picName+" Uploaded successfull");             
                                self.onUpload("img");
                                // here we will handle errors and validation messages
                            }).fail(function( xhr, status, errorThrown ) {
                                    alert( "Sorry, there was a problem!" );
                                    console.log( "Error: " + errorThrown );
                                    console.log( "Status: " + status );
                                    console.dir( xhr );
                            });

                        _inc ++;

                        }
                        self.reviewPicArray = [];
                    }

                    this.saveFiles = function (review_id)
                    {
                       var self = this;
                        var _inc = 1;
                        for(pic in self.filesUploadedList)
                        {

                            var formData = {

                                    picName           : self.filesUploadedList[pic].name,
                                    picData           : self.filesUploadedList[pic].fileData,
                                    review_id         : review_id,
                                    type              : self.filesUploadedList[pic].ext
                            };

                           console.log("File name .................."+formData.picName);


                            // process the form
                            $.ajax({
                                type        : 'POST', // define the type of HTTP verb we want to use (POST for our form)
                                url         : 'api/image_upload/attach_pic.php', // the url where we want to POST
                                data        : formData, // our data object
                                dataType    : 'json', // what type of data do we expect back from the server
                                encode          : true
                            })
                                // using the done promise callback
                            .done(function(data) {

                                // log data to the console so we can see
                             //   console.log(data['code']); 
                               // console.log("file "+formData.picName+" Uploaded successfull");      
                                self.onUpload("file");     

                                // here we will handle errors and validation messages
                            }).fail(function( xhr, status, errorThrown ) {
                                    alert( "Sorry, there was a problem!" );
                                    console.log( "Error: " + errorThrown );
                                    console.log( "Status: " + status );
                                    console.dir( xhr );
                            });

                        _inc ++;

                       }
                    self.filesUploadedList = [];
                       
                    }
            });


        //service to load the reviews from the database
            datahandlerApp.service('LoadReviewService', function($rootScope) {
                
                   this.reviewRead = 0;
                   this.totalReview = -1;

                   this.ID ="";
                   this.reviewDataListFromDatabase = [];

                   this.syncDataset = function($scope)
                   {
                       var self = this;
                       $scope.reviewDataListFromDatabase = self.reviewDataListFromDatabase;
                   }

                   this.onReviewRead = function()
                   {
                       var self = this;
                      //  console.log("onReviewRead");
                       // console.log("Review read"+self.reviewRead);
                       // console.log("Total reviews" + self.totalReview);
                        self.reviewRead ++;
                       if( self.reviewRead == self.totalReview )
                       {
                            console.log("eventOnReviewLoadComplete");
                            $rootScope.$broadcast('eventOnReviewLoadComplete');   
                       }
                   }
                   this.loadSchoolReviews = function(school_id)
                    {
                    
                       var self = this;
                       self.ID = school_id;
                       self.reviewRead = 0;
                       self.totalReview = -1;
                       self.reviewDataListFromDatabase = [];

                      //  console.log("loadSchoolReviews" + self.ID);

                        var formData = {
                                school_id     : self.ID
                        };

                       // console.log(formData);

                        // process the formf
                        $.ajax({
                            type        : 'POST', // define the type of HTTP verb we want to use (POST for our form)
                            url         : 'api/load_data/load_review.php', // the url where we want to POST
                            data        : formData, // our data object
                            dataType    : 'json', // what type of data do we expect back from the server
                            encode          : true
                        })
                            // using the done promise callback
                        .done(function(data) {

                                self.totalReview = data.length;
                                console.log("Total reviews ------------:"+ self.totalReview);

                                for(review_i in data)
                                {
                                   // console.log("Review Data successfull fetched");
                                    self.processReviewData(data[review_i]);
                                }
                                //event load reviews complete
                            // here we will handle errors and validation messages
                        }).fail(function( xhr, status, errorThrown ) {
                                console.log( "Query Failed" );
                                console.log( "Error: " + errorThrown );
                                console.log( "Status: " + status );
                                console.dir( xhr );
                                return false;
                        });
                        
                    }

                    this.processReviewData = function(review_data)
                    {
                    
                        var self = this;
                        var formData = {
                                review_id     : review_data.id_review_data,
                                type          : "D"
                        };

                        //console.log(formData);

                        // process the formf
                        $.ajax({
                            type        : 'POST', // define the type of HTTP verb we want to use (POST for our form)
                            url         : 'api/load_data/load_review_action.php', // the url where we want to POST
                            data        : formData, // our data object
                            dataType    : 'json', // what type of data do we expect back from the server
                            encode          : true
                        })
                            // using the done promise callback
                        .done(function(data) {
                            //data may be 0 to 3 size 
                            
                            var dislikeCount,likeCount;
                            
                            for (i_data in data)
                                {
                                    if(data[i_data]['action'] == 'L')
                                        {
                                            likeCount = data[i_data]['count'];
                                        }
                                    else if(data[i_data]['action'] == 'D')
                                        {
                                            dislikeCount = data[i_data]['count'];
                                        }
                                }
                            console.log("Dislike "+ dislikeCount);
                            console.log("likeCount "+ likeCount);
                            if(!dislikeCount)
                                dislikeCount = 0;
                            if(!likeCount)
                                likeCount = 0;
                            
                            //event
                            self.prepareDataSet(review_data,likeCount,dislikeCount);

                            // here we will handle errors and validation messages
                        }).fail(function( xhr, status, errorThrown ) {
                                console.log( "Query Failed" );
                                console.log( "Error: " + errorThrown );
                                console.log( "Status: " + status );
                                console.dir( xhr );
                                return false;
                        });
                        
                    
                    }

                    this.prepareDataSet = function(data,likeCount,dislikeCount)
                    {
                           var self = this;    
                            var reviewData = new Object();
                            reviewData.userProfilePic  = data.pic;
                            reviewData.userName = data.username;
                            reviewData.review_date = data.review_date; 
                            reviewData.reviewTitle = data.tbl_review_title;
                            reviewData.reviewText = data.tbl_review_text;
                            reviewData.reviewID   = data.id_review_data;
                            reviewData.likeCount  = likeCount;
                            reviewData.dislikeCount = dislikeCount;
                            reviewData.picCollection = [];
                            reviewData.fileCollection = [];
                            reviewData.commentCollection = [];
                            self.loadAttachments(data.id_review_data,  reviewData.picCollection,  reviewData.fileCollection);
                            self.loadComments(data.id_review_data,reviewData.commentCollection);
                        //    console.log(reviewData);

                            self.reviewDataListFromDatabase.push(reviewData); 


                    }

                    this.loadComments = function(review_id,commentCollection)
                    {

                        var self = this ;
                        var formData = {
                                review_id     : review_id
                        };

                        console.log(formData);

                        // process the formf
                        $.ajax({
                            type        : 'POST', // define the type of HTTP verb we want to use (POST for our form)
                            url         : 'api/load_data/load_comment.php', // the url where we want to POST
                            data        : formData, // our data object
                            dataType    : 'json', // what type of data do we expect back from the server
                            encode          : true
                        })
                            // using the done promise callback
                        .done(function(data) {

                             var _inc = 0;
                            for(itr in data)
                            { 
                                var d = new Object();
                                d.user_name = data[itr].username;
                                d.user_pic_src = data[itr].pic;
                                d.data_time    = data[itr].date_time;
                                d.comment_text = data[itr].comment_text;
                                commentCollection.push(d);
                                _inc ++;
                            }
                           
                            self.onReviewRead();

                            // here we will handle errors and validation messages
                        }).fail(function( xhr, status, errorThrown ) {
                                console.log( "Query Failed" );
                                console.log( "Error: " + errorThrown );
                                console.log( "Status: " + status );
                                console.dir( xhr );
                                return false;
                        }); 

                    }

                    this.loadAttachments = function(review_id_i, picCollection ,fileCollection)
                    {
                        var self = this ;
                        var formData = {
                                review_id     : review_id_i
                        };

                        console.log(formData);

                        // process the formf
                        $.ajax({
                            type        : 'POST', // define the type of HTTP verb we want to use (POST for our form)
                            url         : 'api/load_data/load_images.php', // the url where we want to POST
                            data        : formData, // our data object
                            dataType    : 'json', // what type of data do we expect back from the server
                            encode          : true
                        })
                            // using the done promise callback
                        .done(function(data) {
                            console.log("load attachments");
                            //event
                            self.loadFiles(data,review_id_i,picCollection, fileCollection);
                           

                            // here we will handle errors and validation messages
                        }).fail(function( xhr, status, errorThrown ) {
                                console.log( "Query Failed" );
                                console.log( "Error: " + errorThrown );
                                console.log( "Status: " + status );
                                console.dir( xhr );
                                return false;
                        }); 
                    }

                    this.loadFiles = function(fileArray,review_id ,picCollection,fileCollection)
                    {   
                        var _inc = 0;
                        for(pic in fileArray)
                        { 
                            var data = new Object();
                            data.imgId = 'pictorial_'+review_id +'_'+_inc;
                            data.src = "api/image_upload/"+fileArray[pic].attachment_path;
                            data.file_name = fileArray[pic].file_name;
                            data.type =  fileArray[pic].attachment_type;

                            if(data.type == '.xls' || data.type =='.doc' ||data.type == '.pdf')
                            {
                                fileCollection.push(data);
                            }
                            else 
                            {
                                 picCollection.push(data);     
                            }
                            _inc ++;
                        }
                    }
                    
                   

            });