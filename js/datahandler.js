
            
                /** For auto complete */
                     var cache = {};
                 
  
                $(document).ready(function(){
                        $('.selectpicker').selectpicker({
                            size: 16
                        });



                        load();


                  
                });
     
                             
        //loading autocomplete function  
                function load()
                {
                    
                    var schoolLocation = /** @type {!HTMLInputElement} */(
                        document.getElementById('school_location_search'));
                    if(google)
                    {               
                        var autocompleteLocation = new google.maps.places.Autocomplete(schoolLocation);
                        autocompleteLocation.addListener('place_changed', function() {
                            var place = autocompleteLocation.getPlace();
                            if (!place.geometry) {
                                window.alert("Autocomplete's returned place contains no geometry");
                                return;
                            }
                            
                            var map_location_latitude = place.geometry.location.lat();
                            var map_location_longitude = place.geometry.location.lng();  
                            console.log(map_location_latitude);
                            console.log(map_location_longitude);
                        });
                    }
                    
                }
                         
                /**End */


                var datahandlerApp= angular.module('searchApp', ["ngRoute",'ui.bootstrap']);

                datahandlerApp.config(function($routeProvider) {
                    $routeProvider
                    .when("/school_id:ID", {
                        templateUrl : "school.html",
                        controller:'schoolDisplayController'
                    })
                    .when("/user_id:ID", {
                        templateUrl : "user.htm",
                         controller:'userController'
                    })
                    .when("/admin", {
                        templateUrl : "admin.htm",
                         controller:'adminController'
                    });
                });


             
                datahandlerApp.controller('schoolDisplayController', function($scope,CompareService,PictureGalleryService,SaveRatingService,SaveReviewService,LoadReviewService,SaveCommentService,LikeDislikeService,$routeParams,Map) {
                    $scope.currentTab = 'Tab1' ;
                    $scope.ID = $routeParams.ID.slice( 1 );
                    $scope.reviewPicArray = [];
                    $scope.filesUploadedList = [];
                    $scope.uploadedFilesList = [];
                    $scope.reviewDataListFromDatabase = [];
                    $scope.generalRatingDatabase = [];
                    $scope.pictureGalleryNames = [];
                    $scope.rating1 = 5;
                    $scope.isReadonly = true;
                    $scope.isSchoolCompared = false;
                    $scope.numberOfSchoolsToCompare = 0;
                    $scope.user_id = localStorage.getItem("user_id");
                    
                    $scope.isCommentSaved = false;

                    $scope.review_heading = "";
                    $scope.review_text = "";
                    $scope.reviewComment = "";


                    /** Ratings Variable  */

                    $scope.rating_heading = "";
                    $scope.rating_text = "",
                    $scope.rating_value = 0,


                    $scope.profileName = localStorage.getItem("username");
                    $scope.emailID = localStorage.getItem("email");
                    $scope.imageUrl = localStorage.getItem("imageurl");

                    $scope.school_data = {principal_name:"",
                                          school_id:"",
                                          name: "",
                                          address:"",
                                          session_timmings:"",
                                          city : "",
                                          category :"",  
                                          school_type :"",		     
                                          courses :"",			      
                                          school_size:"", 		      
                                          board :"",				      
                                          medium_of_teaching:"",        
                                          religous_preference :"",      
                                          small_description :"",	    
                                          contact :"",                  
                                          email :"",                    
                                          admission_description:"",     
                                          average_rating_score:"",     
                                          weblink :"",                                           
                                          country :"",                   
                                          pin :"",                      
                                          profile_pic_data :"",         
                                          admission_method :"",         

                                            };
                
                  //events 

                   $scope.$on('eventOnReviewLoadComplete', function () {

                        console.log("eventOnReviewLoadComplete");
                        LoadReviewService.syncDataset($scope);
                        $scope.user_id = localStorage.getItem("user_id");
                        $scope.review_heading = "";
                        $scope.review_text = "";
                        $scope.profileName = localStorage.getItem("username");
                        $scope.emailID = localStorage.getItem("email");
                        $scope.imageUrl = localStorage.getItem("imageurl");

                         
                         console.log($scope.reviewDataListFromDatabase);
                         $scope.$apply();
                    });

                    $scope.$on('eventOnReviewSaveComplete', function () {
                        console.log("eventOnReviewSaveComplete");
                        $scope.user_id = localStorage.getItem("user_id");
                        $scope.profileName = localStorage.getItem("username");
                        $scope.emailID = localStorage.getItem("email");
                        $scope.imageUrl = localStorage.getItem("imageurl");
                        $scope.cleanUp();
                        LoadReviewService.loadSchoolReviews($scope.ID);
                       
                    });

                    $scope.$on('eventOnRatingSaveComplete', function () {
                        console.log("eventOnRatingSaveComplete");
                        $scope.user_id = localStorage.getItem("user_id");
                        $scope.profileName = localStorage.getItem("username");
                        $scope.emailID = localStorage.getItem("email");
                        $scope.imageUrl = localStorage.getItem("imageurl");
                        $scope.cleanUp();
                        SaveRatingService.loadSchoolRatings($scope.ID);
                        
                    });


                    $scope.$on('eventOnLoadingRatingComplete', function(){
                            console.log("eventOnLoadingRatingComplete");
                            $scope.generalRatingDatabase = [];
                            SaveRatingService.syncDataset($scope);

                            $scope.$apply();
                    });

                    

                    $scope.$on('eventLoadPictureGallery', function(){
                            console.log("eventLoadPictureGallery");
                            $scope.pictureGalleryNames = [];
                            $scope.pictureGalleryNames =  PictureGalleryService.syncDataset();
                            console.log($scope.pictureGalleryNames);
                            PictureGalleryService.createPictureGallery($scope);
                            jQuery("#nanoGallery1").nanoGallery('reload');
                            $scope.$apply();
                    });
                    
                     $scope.$on('eventMaxNumberOfSchoolsReached', function(){
                        console.log("eventMaxNumberOfSchoolsReached");
                        alert("Please remove any school from comparison to add the current school in comparison ");

                    });

                     $scope.$on('eventReadSchoolData', function(){
                        console.log("eventReadSchoolData");
                       
                        $scope.schoolCompareData = [];
                        CompareService.syncDataset($scope);
                        console.log($scope.schoolCompareData);
                        $scope.$apply();
                    });

                    $scope.$on('eventSchoolRemovedFromCompare',function(){

                        console.log("eventSchoolRemovedFromCompare");
                        $scope.schoolCompareData = [];
                        CompareService.syncDataset($scope);
                        console.log($scope.schoolCompareData);

                        if($scope.numberOfSchoolsToCompare == 0)
                        {
                            $scope.isSchoolCompared = false;
                        }
                      
                        $scope.$apply();

                    });

                    $scope.$on('eventUserActionSaveComplete', function (event,args) {  //like dislike action complete
                        console.log("eventUserActionSaveComplete");
                        var reviewID = args ;
                        var totalLike , totalDislike ;
                        var data = LikeDislikeService.syncDataset(reviewID);
                         totalLike = data.totalLike;
                         totalDislike = data.totalDislike
              
                        for (itr in $scope.reviewDataListFromDatabase )
                        {
                            if(parseInt($scope.reviewDataListFromDatabase[itr].reviewID) == parseInt(reviewID) )
                            {     
                                $scope.reviewDataListFromDatabase [itr].likeCount = totalLike;
                                $scope.reviewDataListFromDatabase  [itr].dislikeCount = totalDislike;               
                                break;
                            }
                        }                
                        $scope.$apply();
                    });



                  //Methods 

                  $scope.addToCompare = function()
                  {
                      console.log("School added for comparison");
                      if(CompareService.addSchoolToCompare($scope.ID))
                      {
                        $scope.isSchoolCompared = true;
                      }
                  }

                  $scope.removeFromCompare = function(school_id)
                  {
                      CompareService.removeSchoolfromCompare(school_id);
                  }

                  $scope.userActionOnReview = function(review_id,isLike)
                  {
                     LikeDislikeService.saveUserAction(review_id,isLike,$scope.user_id);
                  }

                  $scope.getRatingArray = function (value)
                  {
                      var list = [];
                        for (var i = 1; i <= value; i++) {
                            list.push(i);
                        }
                      return list;
                  }

                  $scope.commentEntered = function (event)
                  {
                    console.log(event.target.id); 
                    var id = event.target.id;
                    var reviewComment = $("#"+id).val()
                    console.log(reviewComment);

                    $("#"+id).val("");
                    $("#"+id+"D").append("<span>"+reviewComment+"</span><br>");

                    var review_id = id.substr(0, id.indexOf('_')); 
                    SaveCommentService.saveComment($scope.user_id,review_id,reviewComment);

                  }

                   $scope.cleanUp = function()
                   {
                        $scope.reviewPicArray = [];
                        $scope.filesUploadedList = [];
                        $scope.uploadedFilesList = [];
                        $scope.reviewDataListFromDatabase = [];
                        $scope.reviewDataListFromDatabase = [];
                        $scope.review_heading = "";
                        $scope.review_text = "";   
                   }

                   $scope.saveReview = function()
                   {
                       SaveReviewService.saveReview($scope);
                   }

                   $scope.saveRating = function()
                   {

                       $scope.rating_value  =  $("#ratings").rateYo("option", "rating"); //retuns the rating
                       //rating of the review
                       console.log($scope.rating_value);
                       SaveRatingService.saveRating($scope);
                        $scope.rating_heading = "";
                        $scope.rating_text = "",
                        $scope.rating_value = 0,

                        $("#ratings").rateYo("option", "rating", 0); //returns a jQuery Element
                   }

                    $scope.imageUploaded = function(input) {
                      
                          if (input.files && input.files[0]) {
                                var reader = new FileReader();

                                reader.onload = function (e) {
                                     
                                    var review_pic = new Object();
                                    review_pic.picData = e.target.result;
                                    $scope.reviewPicArray.push(review_pic);
                                    
                                   jQuery('#review_pic_block').append("<img id='theImg' class='img-thumbnail' src='"+ e.target.result +"' width='100px' height='100px' />");
                                }

                                reader.readAsDataURL(input.files[0]);
                            }
                    }


                     $scope.fileUploaded = function(input) {
                          if (input.files && input.files[0]) {

                                var validExts = new Array(".xlsx", ".xls", ".csv",".doc",".jpg",".pdf",".docx");
                                var fileExt = input.value;
                                fileExt = fileExt.substring(fileExt.lastIndexOf('.'));
                                if (validExts.indexOf(fileExt) < 0) {
                                        alert("Invalid file selected, valid files are of " +
                                        validExts.toString() + " types.");
                                        return false;
                                }
                                else 
                                {
                                    var reader = new FileReader();
                                    reader.onload = function (e) { 
                                        var file_attach = new Object();
                                        file_attach.fileData = e.target.result;
                                        file_attach.ext      = input.files[0].name.substring(input.files[0].name.lastIndexOf('.'));	 
                                        file_attach.name     = input.files[0].name.replace(/\.[^/.]+$/, "");
                                        $scope.filesUploadedList.push(file_attach); 
                                        $scope.uploadedFilesList.push(input.files[0].name);
                                        $scope.$apply();
                                    }
                                    reader.readAsDataURL(input.files[0]);
                                }

                              
                            }
                    }


                    $scope.onOverviewClick = function(){
                        $scope.currentTab = 'Tab1';
                    }

                    $scope.rateFunction = function(rating) {
                          console.log('Rating selected: ' + rating);
                    };

                    $scope.searchExactSchoolID = function()
                    {
                        
                        console.log("searchExact Search "+ $scope.ID);
                        $.ajax({
                                type: "GET", 
                                url: "api/search_api/search_id.php", 
                                data: {"school_id" : $scope.ID},
                                success: function(response)
                                {
                                
                                    
                                    for (var i in response) 
                                    {
                                    
                                        $scope.school_data.principal_name              =   response[i].principal_name;
                                        $scope.school_data.school_id                  =   response[i].school_id;
                                        $scope.school_data.name 		                = 	response[i].school_name;
                                        $scope.school_data.address                	=   response[i].address;
                                        var distance                   =   5;

                                    

                                        if(google)
                                        {
                                            var latlng = new google.maps.LatLng(
                                            parseFloat(response[i].latitude),
                                            parseFloat(response[i].longitude));
                                            school_latlng = latlng;
                                        }
                                       


                                        $scope.school_data.session_timmings 	   =   getSessionTimingString        (parseInt(response[i].session_timmings));
                                        $scope.school_data.city 				   =   response[i].city;
                                        $scope.school_data.category 			   =   getCategoryString             (parseInt(response[i].category));  
                                        $scope.school_data.school_type 		       =   response[i].school_type; 
                                        $scope.school_data.courses 			       =   getCourseString               (parseInt(response[i].courses));
                                        $scope.school_data.school_size 		       =   getSchoolSizeString           (parseInt(response[i].school_size));
                                        $scope.school_data.board 				   =   getSchoolBoardString          (parseInt(response[i].board));
                                        $scope.school_data.medium_of_teaching      =   getMediumOfTeachingString     (parseInt(response[i].medium_of_teaching));
                                        $scope.school_data.religous_preference     =   getReligousPreferencesString  (parseInt(response[i].religous_preference));
                                        $scope.school_data.small_description 	   =   response[i].small_description;
                                        $scope.school_data.contact                 =   response[i].contact;
                                        $scope.school_data.email                   =   response[i].email;
                                        $scope.school_data.admission_description   =   response[i].admission_desciption;
                                        $scope.school_data.average_rating_score    =   response[i].average_rating_score;
                                        $scope.school_data.weblink                 =   response[i].web_link;                           
                                        $scope.school_data.country                 =   response[i].country;
                                        $scope.school_data.pin                     =   response[i].pin;
                                        $scope.school_data.profile_pic_data        =   response[i].profile_pic_data;
                                        $scope.school_data.mobility                =   response[i].mobility;
                                        $scope.school_data.admission_method        =   getAdmissionMethodString      (parseInt(response[i].admission_method));
                                        
                                        console.log("latitude and longitude" + latlng);

                                         Map.deleteMarkers();
                                         Map.searchLatLng($scope.school_data.name,latlng)
                                        .then(
                                            function(res) { // success
                                                Map.addMarker(res);
                                                $scope.place.name = res.name;
                                                $scope.place.lat = res.geometry.location.lat();
                                                $scope.place.lng = res.geometry.location.lng();

                                            },
                                            function(status) { // error
                                                $scope.apiError = true;
                                                $scope.apiStatus = status;
                                                console.log($scope.apiError);
                                                console.log($scope.apiStatus);
                                            }
                                        );
                                
                                                  
                                        break;
                                    }
                                    
                            
                                },
                                dataType: "json"//set to JSON    
                            })      
                    }
                    
                    $scope.onReviewClick =function() {
                        $scope.currentTab = 'Tab2';
                    }

                    $scope.onCompareClick = function(){
                        $scope.currentTab = 'Tab5';
                        CompareService.readAllSchools();
                    }


                    $scope.pictureUpload =function(event){

                        var pic = event.target;
                        PictureGalleryService.pictureUpload(pic);
                    }


                    // at the bottom of your controller
                    var init = function () {

                        console.log("caller is " + arguments.callee.caller.name.toString());
                        console.log("Init called ............................");
                        $scope.searchExactSchoolID();
                        LoadReviewService.loadSchoolReviews($scope.ID); //service call to load all reviews in the list on startup
                        SaveRatingService.loadSchoolRatings($scope.ID);
                        console.log($scope.reviewDataListFromDatabase);

                        createCookie('school_id',$scope.ID,1); 
                        PictureGalleryService.startPictureGallery($scope.ID);
                   
                    // check if there is query in url
                    // and fire search in case its value is not empty
                    };
                    // and fire it after definition
                    init();

                });

                datahandlerApp.controller('userController', function($scope,$routeParams) {

                    $scope.ID = $routeParams.ID;
                });
                
                datahandlerApp.controller('adminController', function($scope) {


                });



                datahandlerApp.filter('startFrom', function() {
                    return function(input, start) {
                        start = +start; //parse to int
                        return input.slice(start);
                    }
                });

                //map controller

                datahandlerApp.controller('searchController', function($scope, Map,LoginLogoutService) {

                    $scope.currentPage = 0;
                    $scope.pageSize = 5;
                    $scope.profileName ="";

                    $scope.isLoggedIn = false;

                    $scope.filter_list = [];
                    $scope.bread_crums_strings = [];
                    $scope.place = {};
                    $scope.school_name = "";
                    $scope.markers = [];
                    $scope.markerNodes = [];
                    $scope.isSchoolVisible = true;
                    $scope.schoolMainListVisible = true;
                    $scope.school_name_id_map = {};

                    $scope.filtered_dataSet = [];

                    $scope.filter_selected = function() {  // to populate bread crums

                        $scope.fill_breadCrums ();
                       
                    }
                    $scope.setProfileName = function(name)
                    {
                        console.log("Setting Username")
                        $scope.profileName = name;
                    }

                    $scope.loginKeyPress = function(e) {
         
                        if (e.keyCode == 13) {
                        $scope.callLogin();  //Fire Search event on Enter Click
                            return true;
                        }
                    }

                    $scope.callLogin = function ()
                    {
                        LoginLogoutService.login();
                        $scope.profileName = LoginLogoutService.getUser();
                    }

                    $scope.callLogout = function()
                    {
                        LoginLogoutService.logout();
                    }

                    $scope.init = function()
                    {
                   
                         var schoolLocation = localStorage.getItem("school_location");
                         var schoolName = localStorage.getItem("school_name");
                         var profileName = localStorage.getItem("username");

                         $scope.profileName = profileName;

                         if($scope.profileName)
                         {
                             $scope.isLoggedIn = true;  
                           console.log("User is logged in ");
                         }
                         else 
                         {
                             console.log("user is not logged in");
                              $scope.isLoggedIn = false;
                         }

                         var emailID = localStorage.getItem("email");
                         var imageUrl = localStorage.getItem("imageurl");
                         var isLocationSearch = localStorage.getItem("isLocationSearch");

                         console.log(schoolLocation);
                         if(isLocationSearch == "1")
                         {
                            $scope.searchPlace = schoolLocation;
                            $("#school_location_search").val(schoolLocation);

                            console.log($scope.searchPlace);
                            //set the value of the string box 
                            //set image 
                            $scope.search ();
                         }

                    }

                 

                    $scope.schoolNameAutocomplete = function()
                    {
                              jQuery( "#school_name_search_txt" ).autocomplete({
                                minLength: 2,
                                source: function( request, response ) {
                                    var term = request.term;
                                    if ( term in cache ) {
                                    response( cache[ term ] );
                                    return;
                                }
                                
                                     var formData = {
                                        session_timing    : -1,
                                        category    : -1,
                                        course  : -1,
                                        school_size: -1,
                                        school_board: -1,
                                        medium :-1,
                                        adm_method: -1,
                                        religous : -1,
                                        term :term
                                    };
                                

                                     $scope.filter_list.forEach(function(element) {
                                        var fd =  filterData;
                                        dataSetValue = 0;
                                        dataSetString = "";
                                        var value = parseInt(element);

                                        if(value >= 0 && value <= 2)
                                        {
                                            fd =getFilterData("session_timing",value,dataSetValue,dataSetString)
                                            if(parseInt(fd.dataSetValue) != -1)
                                            {
                                                formData.session_timing = parseInt(fd.dataSetValue);
                                            }
                                        }
                                        else if (value >=3 && value <=5)
                                        {
                                            fd = getFilterData("category",value,dataSetValue,dataSetString)
                                            if(parseInt(fd.dataSetValue) != -1)
                                            {
                                                formData.category = parseInt(fd.dataSetValue);
                                            }
                                        }
                                        else if(value >=6 && value <=11)
                                        {
                                            fd = getFilterData("course",value,dataSetValue,dataSetString)
                                            if(parseInt(fd.dataSetValue) != parseInt(courses))
                                            {
                                                formData.course = parseInt(fd.dataSetValue);
                                            }
                                        }
                                        else if (value >=12 && value <=14)
                                        {
                                             fd = getFilterData("school_size",value,dataSetValue,dataSetString)
                                            if(parseInt(fd.dataSetValue) != parseInt(school_size))
                                            {
                                                formData.school_size = parseInt(fd.dataSetValue);
                                            }
                                        }
                                        else if(value >= 15 && value <=17)
                                        {
                                            fd =getFilterData("school_board",value,dataSetValue,dataSetString)
                                            if(parseInt(fd.dataSetValue) != parseInt(board))
                                            {
                                                formData.school_board = parseInt(fd.dataSetValue);
                                            }
                                        }
                                        else if (value >=18 && value <=21)
                                        {
                                            fd =getFilterData("medium",value,dataSetValue,dataSetString)
                                            if(parseInt(fd.dataSetValue) != parseInt(medium_of_teaching))
                                            {
                                                 formData.medium = parseInt(fd.dataSetValue);
                                            }
                                        }
                                        else if (value >=22 && value <= 26)
                                        {
                                            fd = getFilterData("adm_method",value,dataSetValue,dataSetString)
                                            if(parseInt(fd.dataSetValue) != parseInt(admission_method))
                                            {
                                                formData.adm_method = parseInt(fd.dataSetValue);
                                            }
                                        }
                                        else if (value >= 27 && value <=31)
                                        {
                                            fd = getFilterData("religious",value,dataSetValue,dataSetString)
                                            if(parseInt(fd.dataSetValue) != parseInt(religous_preference))
                                            {
                                                formData.religous = parseInt(fd.dataSetValue);
                                            }
                                        }
                                      
                                            
                                    }, this);

                                    console.log(formData);

                                      $.ajax({
                                            type        : 'POST', // define the type of HTTP verb we want to use (POST for our form)
                                            url         : 'api/search_api/search_school_name.php', // the url where we want to POST
                                            data        : formData, // our data object
                                            dataType    : 'json', // what type of data do we expect back from the server
                                            encode      : true
                                        })
                                            // using the done promise callback
                                        .done(function(data) {   
                                                console.log("Autocomplete ran on school name search");
                                                var results = [];

                                                for ( i = 0; i < data.length ; i++)
                                                {
                                                    $scope.school_name_id_map[data[i]['school_name']] = data[i]['school_id'];
                                                    results.push(data[i]['school_name']);

                                                }

                                                console.log(results);
                                                console.log($scope.school_name_id_map);
                                                cache[ term ] = results;  
                                                response(results);
                                            // here we will handle errors and validation messages
                                        }).fail(function( xhr, status, errorThrown ) {
                                                console.log( "Query Failed" );
                                                console.log( "Error: " + errorThrown );
                                                console.log( "Status: " + status );
                                                console.dir( xhr );
                                                return false;
                                        });
                                },
                                    messages: {
                                        noResults: '',
                                        results: function() {}
                                    }
                                });
                    }

                    $scope.showBorder = function()
                    {
                        if($scope.isSchoolVisible == true || $scope.schoolMainListVisible == true)
                        {
                            return true;
                        }
                        else
                        {
                            return false;
                        }
                    }

                    $scope.schoolLinkClicked = function(){
                        $scope.isSchoolVisible = true;
                        $scope.schoolMainListVisible = false;
                        console.log("School would be visible ");
                    }

                    $scope.fill_breadCrums = function(){

                        $scope.bread_crums_strings = [];
                       $scope.filter_list.forEach(function(element) {   
                            var fd =  filterData;
                           fd = getFilterStrings(parseInt(element));
                            $scope.bread_crums_strings.push(fd.dataSetString);
                            
                       }, this);

                      // console.log($scope.bread_crums_strings);
                    }


                     $scope.downloadUrl = function(url, callback) {

                        var request = window.ActiveXObject ?
                            new ActiveXObject('Microsoft.XMLHTTP') :
                            new XMLHttpRequest;

                        request.onreadystatechange = function() {
                            if (request.readyState == 4) {
                            request.onreadystatechange = $scope.doNothing;
                            callback(request.responseText, request.status);
                            }
                        };

                        request.open('GET', url, true);
                        request.send(null);
                    }
                    
                    $scope.doNothing = function(){

                    }

                    $scope.parseXml = function(str) {
                            if (window.ActiveXObject) {
                                var doc = new ActiveXObject('Microsoft.XMLDOM');
                                doc.loadXML(str);
                                return doc;
                            } else if (window.DOMParser) {
                                return (new DOMParser).parseFromString(str, 'text/xml');
                            }
                        }
                     $scope.numPages = function() {
                                return Math.ceil($scope.filtered_dataSet.length / $scope.pageSize);
                     }

                     $scope.isDataAvailable = function(){
                         if($scope.filtered_dataSet.length == 0)
                         {
                             return false;
                         }
                         else
                         {
                             return true;
                         }
                     }

                   

                    $scope.searchLocationsNear = function(center,radius)
                    {
                            console.log("searchInlocationNear");
                        
                             var formData = {
                                    lat     : center.lat,
                                    lng    : center.lng,
                                    radius : radius
                                };

                            console.log(formData);

                                // process the formf
                            $.ajax({
                                type        : 'GET', // define the type of HTTP verb we want to use (POST for our form)
                                url         : 'api/map_api/phpsqlsearch_genxml.php', // the url where we want to POST
                                data        : formData, // our data object
                                dataType    : 'xml', // what type of data do we expect back from the server
                                encode          : true
                            })
                                // using the done promise callback
                            .done(function(data) {   
                                  
                                console.log("Search started ......");
                               // console.log(data);
     
                              //  var xml = $scope.parseXml(data);
                                xml = data;
                                console.log(xml);
                            
                                markerNodes = xml.documentElement.getElementsByTagName("marker");

                                if(google)
                                {
                                    var bounds = new google.maps.LatLngBounds();
                                }
                                
                                //console.log("marker nodes "+markerNodes.length);
                                
                                if(markerNodes.length == 0)
                                {
                                     console.log("No Schools found");
                                     return;
                                }
                                
                               // console.log("Markers found");

                            
                            
                                for (var i = 0; i < markerNodes.length; i++) {

                                  
                                    
                                    var school_id  =  	markerNodes[i].getAttribute("school_id");
                                    var name 		= 	markerNodes[i].getAttribute("name");
                                    var address 	=   markerNodes[i].getAttribute("address");
                                    var contact     =   markerNodes[i].getAttribute("contact");
                                    var distance   =   parseFloat(markerNodes[i].getAttribute("distance"));

                                    var latlng;

                                    if(google)
                                    {
                                    latlng = new google.maps.LatLng(
                                        parseFloat(markerNodes[i].getAttribute("lat")),
                                        parseFloat(markerNodes[i].getAttribute("lng")));
                                    }
                                    var session_timings 	=   markerNodes[i].getAttribute("session_timing");
                                    var city 				=   markerNodes[i].getAttribute("city");
                                    var category 			=   markerNodes[i].getAttribute("category");
                                    var school_type 		=   markerNodes[i].getAttribute("school_type");
                                    var courses 			=   markerNodes[i].getAttribute("courses");
                                    var school_size 		=   markerNodes[i].getAttribute("school_size");
                                    var board 				=   markerNodes[i].getAttribute("board");
                                    var medium_of_teaching  =   markerNodes[i].getAttribute("medium_of_teaching");
                                    var religous_preference	=   markerNodes[i].getAttribute("religous_preference");
                                    var small_description 	=   markerNodes[i].getAttribute("small_description");
                                    var profile_pic_data    =   markerNodes[i].getAttribute("profile_pic_data");
                                    var admission_method    =   markerNodes[i].getAttribute("admission_method");

                                    
                                    var satisfyFilter = true;

                                   // console.log("Search Filters");
                                   // console.log($scope.filter_list);

                                    $scope.filter_list.forEach(function(element) {
                                        var fd =  filterData;
                                        dataSetValue = 0;
                                        dataSetString = "";
                                        var value = parseInt(element);

                                        if(value >= 0 && value <= 2)
                                        {
                                            fd =getFilterData("session_timing",value,dataSetValue,dataSetString)
                                            if(parseInt(fd.dataSetValue) != parseInt(session_timings))
                                            {
                                                console.log("Failed " + fd.dataSetValue + "database value" + session_timings);
                                                satisfyFilter = false;
                                            }
                                        }
                                        else if (value >=3 && value <=5)
                                        {
                                            fd = getFilterData("category",value,dataSetValue,dataSetString)
                                            if(parseInt(fd.dataSetValue) != parseInt(category))
                                            {
                                                satisfyFilter = false;
                                            }
                                        }
                                        else if(value >=6 && value <=11)
                                        {
                                            fd = getFilterData("course",value,dataSetValue,dataSetString)
                                            if(parseInt(fd.dataSetValue) != parseInt(courses))
                                            {
                                                satisfyFilter = false;
                                            }
                                        }
                                        else if (value >=12 && value <=14)
                                        {
                                             fd = getFilterData("school_size",value,dataSetValue,dataSetString)
                                            if(parseInt(fd.dataSetValue) != parseInt(school_size))
                                            {
                                                satisfyFilter = false;
                                            }
                                        }
                                        else if(value >= 15 && value <=17)
                                        {
                                            fd =getFilterData("school_board",value,dataSetValue,dataSetString)
                                            if(parseInt(fd.dataSetValue) != parseInt(board))
                                            {
                                                satisfyFilter = false;
                                            }
                                        }
                                        else if (value >=18 && value <=21)
                                        {
                                            fd =getFilterData("medium",value,dataSetValue,dataSetString)
                                            if(parseInt(fd.dataSetValue) != parseInt(medium_of_teaching))
                                            {
                                                satisfyFilter = false;
                                            }
                                        }
                                        else if (value >=22 && value <= 26)
                                        {
                                            fd = getFilterData("adm_method",value,dataSetValue,dataSetString)
                                            if(parseInt(fd.dataSetValue) != parseInt(admission_method))
                                            {
                                                satisfyFilter = false;
                                            }
                                        }
                                        else if (value >= 27 && value <=31)
                                        {
                                            fd = getFilterData("religious",value,dataSetValue,dataSetString)
                                            if(parseInt(fd.dataSetValue) != parseInt(religous_preference))
                                            {
                                                satisfyFilter = false;
                                            }
                                        }
                                      
                                            
                                    }, this);

                                    if(satisfyFilter == true)
                                    {

                                            var school_data = { school_id: '' ,
                                                                 school_name : '' ,
                                                                 school_address : '' ,
                                                                 school_phone : '',
                                                                 profile_pic : '' }; 
                                            school_data.school_name = name;
                                            school_data.school_id = school_id;
                                            school_data.school_address = address;
                                            school_data.school_phone = contact;
                                            school_data.profile_pic = profile_pic_data;
                                            $scope.filtered_dataSet.push(school_data);
                                             Map.addMarkerLocation(latlng,name,address);
                                           
                                    }
                                    
                                     $scope.$apply();
                                }

                                // here we will handle errors and validation messages
                            }).fail(function( xhr, status, errorThrown ) {
                                    console.log( "Query Failed" );
                                    console.log( "Error: " + errorThrown );
                                    console.log( "Status: " + status );
                                    console.dir( xhr );
                                    return false;
                            });
                            
                    }


                    $scope.findSchoolInLocation = function (){

                            var formData = {
                                    latitude     : $scope.place.lat,
                                    longitude    : $scope.place.lat

                                };

                            console.log(formData);

                                // process the formf
                            $.ajax({
                                type        : 'POST', // define the type of HTTP verb we want to use (POST for our form)
                                url         : 'api/search_api/search_location.php', // the url where we want to POST
                                data        : formData, // our data object
                                dataType    : 'json', // what type of data do we expect back from the server
                                encode          : true
                            })
                                // using the done promise callback
                            .done(function(data) {   
                                    $scope.searchLocationsNear($scope.place,5);       
                                    console.log($scope.filtered_dataSet);
                                // here we will handle errors and validation messages
                            }).fail(function( xhr, status, errorThrown ) {
                                    console.log( "Query Failed" );
                                    console.log( "Error: " + errorThrown );
                                    console.log( "Status: " + status );
                                    console.dir( xhr );
                                    return false;
                            });

                    }

                    $scope.nameSearch = function()
                    {
                        $scope.schoolName = document.getElementById("school_name_search_txt").value;
                        console.log($scope.schoolName);
                        console.log($scope.school_name_id_map);

                        var school_id = $scope.school_name_id_map[$scope.schoolName];
                        console.log(school_id);
                        window.location.href = "#school_id:"+school_id;
                    }
                    
                    $scope.search = function() {

                        $scope.filtered_dataSet = [];
                        $scope.schoolMainListVisible = true;
                        $scope.isSchoolVisible = false;
                        console.log("Search function called");
                        $scope.searchPlace = document.getElementById("school_location_search").value;
                        $scope.schoolName = document.getElementById("school_name_search_txt").value;

                        console.log($scope.searchPlace);
                        if($scope.searchPlace)
                        {
                            //search with the help of location
                            $scope.apiError = false;
                            Map.deleteMarkers();
                            Map.search($scope.searchPlace)
                            .then(
                                function(res) { // success
                                    Map.addMarker(res);
                                    $scope.place.name = res.name;
                                    $scope.place.lat = res.geometry.location.lat();
                                    $scope.place.lng = res.geometry.location.lng();
                                    $scope.findSchoolInLocation();

                                },
                                function(status) { // error
                                    $scope.apiError = true;
                                    $scope.apiStatus = status;
                                    console.log($scope.apiError);
                                    console.log($scope.apiStatus);
                                }
                            );
                        }
                        else if($scope.schoolNameope)
                        {
                            //search through name 
                             $scope.nameSearch();
                             return ; 
                        }
                        else 
                        {
                            $scope.allSchools(); //get all schools in the database and apply only filters 
                        }
                       
                    }

                    $scope.allSchools = function()
                    {

                          $.ajax({
                                type: "GET", 
                                url: "api/search_api/get_all_schools.php", 
                                success: function(response)
                                {
                                
                                    
                                    for (var i in response) 
                                    {
                                    
                                        var principal_name          =   response[i].principal_name;
                                        var school_id               =   response[i].school_id;
                                        var name 		            = 	response[i].school_name;
                                        var address                	=   response[i].address;
                                      

                                       if(google)
                                        {
                                            var latlng = new google.maps.LatLng(
                                            parseFloat(response[i].latitude),
                                            parseFloat(response[i].longitude));
                                           
                                        }
                                      
                                        var session_timings 	    =   response[i].session_timmings;
                                        var city 				    =   response[i].city;
                                        var category 			    =   response[i].category;  
                                        var school_type 		    =   response[i].school_type; 
                                        var courses 			    =   response[i].courses;
                                        var school_size 		    =   response[i].school_size;
                                        var board 				    =   response[i].board;
                                        var medium_of_teaching      =   response[i].medium_of_teaching;
                                        var religous_preference     =   response[i].religous_preference;
                                        var small_description 	    =   response[i].small_description;
                                        var contact                 =   response[i].contact;
                                        var email                   =   response[i].email;
                                        var admission_description   =   response[i].admission_desciption;
                                        var average_rating_score    =   response[i].average_rating_score;
                                        var weblink                 =   response[i].web_link;                           
                                        var country                 =   response[i].country;
                                        var pin                     =   response[i].pin;
                                        var profile_pic_data        =   response[i].profile_pic_data;
                                        var mobility                =   response[i].mobility;
                                        var admission_method        =   response[i].admission_method;
                                        
                                                                            
                                    var satisfyFilter = true;

                                   // console.log("Search Filters");
                                   // console.log($scope.filter_list);

                                    $scope.filter_list.forEach(function(element) {
                                        var fd =  filterData;
                                        dataSetValue = 0;
                                        dataSetString = "";
                                        var value = parseInt(element);

                                        if(value >= 0 && value <= 2)
                                        {
                                            fd =getFilterData("session_timing",value,dataSetValue,dataSetString)
                                            if(parseInt(fd.dataSetValue) != parseInt(session_timings))
                                            {
                                                console.log("Failed " + fd.dataSetValue + "database value" + session_timings);
                                                satisfyFilter = false;
                                            }
                                        }
                                        else if (value >=3 && value <=5)
                                        {
                                            fd = getFilterData("category",value,dataSetValue,dataSetString)
                                            if(parseInt(fd.dataSetValue) != parseInt(category))
                                            {
                                                satisfyFilter = false;
                                            }
                                        }
                                        else if(value >=6 && value <=11)
                                        {
                                            fd = getFilterData("course",value,dataSetValue,dataSetString)
                                            if(parseInt(fd.dataSetValue) != parseInt(courses))
                                            {
                                                satisfyFilter = false;
                                            }
                                        }
                                        else if (value >=12 && value <=14)
                                        {
                                             fd = getFilterData("school_size",value,dataSetValue,dataSetString)
                                            if(parseInt(fd.dataSetValue) != parseInt(school_size))
                                            {
                                                satisfyFilter = false;
                                            }
                                        }
                                        else if(value >= 15 && value <=17)
                                        {
                                            fd =getFilterData("school_board",value,dataSetValue,dataSetString)
                                            if(parseInt(fd.dataSetValue) != parseInt(board))
                                            {
                                                satisfyFilter = false;
                                            }
                                        }
                                        else if (value >=18 && value <=21)
                                        {
                                            fd =getFilterData("medium",value,dataSetValue,dataSetString)
                                            if(parseInt(fd.dataSetValue) != parseInt(medium_of_teaching))
                                            {
                                                satisfyFilter = false;
                                            }
                                        }
                                        else if (value >=22 && value <= 26)
                                        {
                                            fd = getFilterData("adm_method",value,dataSetValue,dataSetString)
                                            if(parseInt(fd.dataSetValue) != parseInt(admission_method))
                                            {
                                                satisfyFilter = false;
                                            }
                                        }
                                        else if (value >= 27 && value <=31)
                                        {
                                            fd = getFilterData("religious",value,dataSetValue,dataSetString)
                                            if(parseInt(fd.dataSetValue) != parseInt(religous_preference))
                                            {
                                                satisfyFilter = false;
                                            }
                                        }
                                      
                                            
                                    }, this);

                                    if(satisfyFilter == true)
                                    {

                                            var school_data = { school_id: '' ,
                                                                 school_name : '' ,
                                                                 school_address : '' ,
                                                                 school_phone : '',
                                                                 profile_pic : '' }; 
                                            school_data.school_name = name;
                                            school_data.school_id = school_id;
                                            school_data.school_address = address;
                                            school_data.school_phone = contact;
                                            school_data.profile_pic = profile_pic_data;
                                            $scope.filtered_dataSet.push(school_data);
                                            Map.addMarkerLocation(latlng,name,address);
                                           
                                    }
                                    
                                    
                                    }
                                    
                                        $scope.$apply();
                                },
                                dataType: "json"//set to JSON    
                            })      
                    }
                    
                    $scope.send = function() {
                        alert($scope.place.name + ' : ' + $scope.place.lat + ', ' + $scope.place.lng);    
                    }
                    
                    Map.init();
                    $scope.init();
                }

              
                        
                );

/* Directives */

datahandlerApp.directive('customOnChange', function() {
  return {
    restrict: 'A',
    link: function (scope, element, attrs) {
      var onChangeHandler = scope.$eval(attrs.customOnChange);
      element.bind('change', onChangeHandler);
    }
  };
});






