

function getSessionTimingString(session_timing)
{
    var ret;
    console.log(session_timing);
    switch(session_timing)
        {
            case 1:
                ret = "Full day(9am - 4pm)";
                break;
            case 2:
                ret = "Half day(7am – 12 pm)";
                break;
            case 3:
                ret = "Evening school(1 pm – 5 pm)";
                break;
        }
    console.log("Session Timing"+ ret);
    return ret;
}

function getCategoryString(category)
{
    var ret;
    switch(category)
        {
            case 1:
                ret = "Government";
                break;
            case 2:
                ret = "Private";
                break;
            case 3:
                ret = "Semi Government";
                break;
        }
    return ret;
}

function getCourseString(course)
{
    var ret;
    switch(course)
        {
            case 1:
                ret = "Pre­Nursery";
                break;
            case 2:
                ret = "Kindergarten";
                break;
            case 3:
                ret = "Primary";
                break;
            case 4:
                ret = "Upper primary";
                break;
            case 5:
                ret = "PUC/12th";
                break;
            case 6:
                ret = "Special school for the handicap";
                break;
        }
    return ret;
}


function getSchoolSizeString(school_size)
{
    var ret;
    switch(school_size)
        {
            case 1:
                ret = " 3000+";
                break;
            case 2:
                ret = "2000+";
                break;
            case 3:
                ret = "1000+";
                break;
            case 4:
                ret = "500+";
                break;
            case 5:
                ret = "500 and below";
                break;
        }
    return ret;
}

function getSchoolBoardString(school_board)
{
    var ret;
    switch(school_board)
        {
            case 1:
                ret = "CBSE";
                break;
            case 2:
                ret = "ICSE";
                break;
            case 3:
                ret = "State Board";
                break;
        }
    return ret;
}

function getMediumOfTeachingString(medium)
{
    var ret;
    switch(medium)
        {
            case 1:
                ret = "English";
                break;
            case 2:
                ret = "Hindi";
                break;
            case 3:
                ret = "Kannada";
                break;
            case 4:
                ret = "Others";
                break;
        }
    return ret;
}

 function getRating(rating)
{
     var rated;
    switch(rating)
        {
            case "1":
                rated = "Bad";
                break;
            case "2":
                rated = "Better";
                break;
            case "3":
                rated = "Good";
                break;
            case "4":
                rated = "Best";
                break;
            case "5":
                rated = "Excellent";
                break;

        }
    return rated;
}
            

function getAdmissionMethodString(adm_method)
{
    var ret;
    switch(adm_method)
        {
            case 1:
                ret = "Interview";
                break;
            case 2:
                ret = "Written test+ interview";
                break;
            case 3:
                ret = "Percent criteria";
                break;
            case 4:
                ret = "School prerogative";
                break;
        }
    return ret;
}


function getReligousPreferencesString(rel)
{
    var ret;
    switch(rel)
        {
            case 1:
                ret = "Govt Neutral";
                break;
            case 2:
                ret = "Hindu trust";
                break;
            case 3:
                ret = "Muslim trust/ Mosque school";
                break;
            case 4:
                ret = "Sikh Gurdyara school";
                break;
            case 5:
                ret = "Christian Missionary school";
                break;
        }
    return ret;
}

function registration_util()
{
     var username = document.getElementById("dtl_username").value;
        var email    = document.getElementById("dtl_email").value;
        var password = document.getElementById("dtl_password").value;
        console.log("register");
         $.ajax({
                    type: "POST", 
                    url: "../api/api_login/registration.php", 
                    data: {"username" :username,
                          "email"     :email,
                          "password"  :password},
                    success: function(response)
                    {
                        console.log(response);   
                          var resultCode  ;
                        
                          resultCode  = 	response.code;
                         
                         console.log(resultCode);
                        if(resultCode == "1")
                            {
                                
                                $(".siginupcontainer").hide();
                                $(".forgetpasswordcontainer").hide();
                                $(".siginincontainer").hide();
                                $(".login-form-popup").hide();
                                $('.md-modal').removeClass('md-show');
                                //save username and email in local storage and start a new sesssion with sesssion id 
                                // session id would be username and time of login 


                                if (typeof(Storage) !== "undefined") {
                                    // Code for localStorage/sessionStorage.
                                    var d = new Date();
                                    var t = d.getTime();
                                    localStorage.setItem("username", username);
                                    localStorage.setItem("email", email);
                                    localStorage.setItem("sessionid", username+t);
                                     
                                    window.location.href = "user_profile.html";
                                } else {
                                    console.log("Local storage not allowed ");
                                }
                            }
                        else
                            {
                                alert("There is some issue in Resistration");
                            }
                        
                    },
                    dataType: "json"//set to JSON    
                });    
}


 

function login_success()
 {
     if(typeof localStorage.getItem("sessionid") !== 'undefined')
    {
        username = localStorage.getItem("username");
        email    = localStorage.getItem("email");        

        $("#login_div").hide();
        $("#account_div").show();
        $("#user_email").html(email);

    }
 }

function login_util(username,password)
{
      // Get some values from elements on the page:
     
     var   url = "../api/api_login/login.php";

      // Send the data using post
      var posting = $.post( url, { username: username , password: password} );
        
     //  Put the results in a div
      posting.done(function( data ) {
          
       console.log(data);
       var dataObj = JSON.parse(data);
          
       if(dataObj.code == "1")   //success
           {
                        $(".siginupcontainer").hide();
                        $(".forgetpasswordcontainer").hide();
                        $(".siginincontainer").hide();
                        $(".login-form-popup").hide();
                        $('.md-modal').removeClass('md-show');
                        //save username and email in local storage and start a new sesssion with sesssion id 
                        // session id would be username and time of login 


                        if (typeof(Storage) !== "undefined") {
                            // Code for localStorage/sessionStorage.
                            var d = new Date();
                            var t = d.getTime();
                            localStorage.setItem("username", dataObj.username);
                            localStorage.setItem("email", dataObj.email);
                            localStorage.setItem("sessionid", username+t);
                            localStorage.setItem("user_id", dataObj.user_id);
                            
                           
                            //if profile is not updated 
                            login_success()
                            
                        } else {
                            console.log("Local storage not allowed ");
                        }
           }
          else if(dataObj.code == "0") //failed
              {
                  console.log("Login failed ");
                  alert("Login Failed "+ dataObj.error);
              }
          
      });
}
     
