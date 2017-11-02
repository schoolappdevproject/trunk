var filter_list = []
var filterData = {dataSetValue: 0,dataSetString:""}

function getFilterStrings(value)
{
    var fd = filterData;


    //console.log(value);
    dataSetString = fd.dataSetString;
    dataSetValue = fd.dataSetValue;
    
    if(value >= 0 && value <= 2)
    {
        fd =getFilterData("session_timing",value,dataSetValue,dataSetString)
    }
    else if (value >=3 && value <=5)
    {
       fd = getFilterData("category",value,dataSetValue,dataSetString)
    }
    else if(value >=6 && value <=11)
    {
        fd = getFilterData("course",value,dataSetValue,dataSetString)
    }
    else if (value >=12 && value <=14)
    {
       fd = getFilterData("school_size",value,dataSetValue,dataSetString)
    }
    else if(value >= 15 && value <=17)
    {
        fd =getFilterData("school_board",value,dataSetValue,dataSetString)
    }
    else if (value >=18 && value <=21)
    {
        fd =getFilterData("medium",value,dataSetValue,dataSetString)
    }
    else if (value >=22 && value <= 26)
    {
        fd = getFilterData("adm_method",value,dataSetValue,dataSetString)
    }
    else if (value >= 27 && value <=31)
    {
        fd = getFilterData("religious",value,dataSetValue,dataSetString)
    }
    return fd;
}


function getFilterData(filterType,value,dataSetValue,dataSetString)
{
   // console.log(value);
     var fd = filterData;
    if(filterType == "session_timing")
    {
        switch(value)
        {
            case 0:
                dataSetValue = 1;
                break;
            case 1:
                dataSetValue = 2;
                break;
            case 2:
                dataSetValue = 3;
                break;
            default:
                dataSetValue = -1;
        }
         dataSetString = getSessionTimingString(dataSetValue);
    }
    else if(filterType == "category")
    {
         switch(value)
        {
            case 3:
                dataSetValue = 1;
                break;
            case 4:
                dataSetValue = 2;
                break;
            case 5:
                dataSetValue = 3;
                break;
            default:
                dataSetValue = -1;
        }
         dataSetString = getCategoryString(dataSetValue);
    }
    else if (filterType == "course")
    {
         switch(value)
        {
            case 6:
                dataSetValue = 1;
                break;
            case 7:
                dataSetValue = 2;
                break;
            case 8:
                dataSetValue = 3;
                break;
            case 9:
                dataSetValue = 4;
                break;
            case 10:
                dataSetValue = 5;
                break;
            case 11:
                dataSetValue = 6;
                break;
            default:
                dataSetValue = -1;
        }
         dataSetString = getCourseString(dataSetValue);
    }
    else if (filterType == "school_size")
    {
         switch(value)
        {
            case 12:
                dataSetValue = 1;
                break;
            case 13:
                dataSetValue = 2;
                break;
            case 14:
                dataSetValue = 3;
                break;
            default:
                dataSetValue = -1;
        }
         dataSetString = getSchoolSizeString(dataSetValue);
    }
    else if (filterType == "school_board")
    {
          switch(value)
        {
            case 15:
                dataSetValue = 1;
                break;
            case 16:
                dataSetValue = 2;
                break;
            case 17:
                dataSetValue = 3;
                break;
            default:
                dataSetValue = -1;
        }
         dataSetString = getSchoolBoardString(dataSetValue);
    }
    else if (filterType == "medium")
    {
          switch(value)
        {
            case 18:
                dataSetValue = 1;
                break;
            case 19:
                dataSetValue = 2;
                break;
            case 20:
                dataSetValue = 3;
                break;
            case 21:
                dataSetValue = 4;
                break;
            default:
                dataSetValue = -1;
        }
         dataSetString = getMediumOfTeachingString(dataSetValue);
    }
    else if (filterType == "adm_method")
    {
          switch(value)
        {
            case 22:
                dataSetValue = 1;
                break;
            case 23:
                dataSetValue = 2;
                break;
            case 24:
                dataSetValue = 3;
                break;
            case 25:
                dataSetValue = 4;
                break;
            case 26:
                dataSetValue = 4;
                break;
            default:
                dataSetValue = -1;
        }
         dataSetString = getAdmissionMethodString(dataSetValue);
    }
     else if (filterType == "religious")
    {
          switch(value)
        {
            case 27:
                dataSetValue = 1;
                break;
            case 28:
                dataSetValue = 2;
                break;
            case 29:
                dataSetValue = 3;
                break;
            case 30:
                dataSetValue = 4;
                break;
            case 31:
                dataSetValue = 5;
                break;
            default:
                dataSetValue = -1;
        }
         dataSetString = getReligousPreferencesString(dataSetValue);
    }

    fd.dataSetString = dataSetString;
    fd.dataSetValue = dataSetValue;
    //console.log("Final Filter Data")
    //console.log(fd);
    return fd;

}

function getSessionTimingString(session_timing)
{
    var ret;
   // console.log(session_timing);
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
            default:
                ret = "";
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
             default:
                ret = "";
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
             default:
                ret = "";
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
             default:
                ret = "";
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
             default:
                ret = "";
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
             default:
                ret = "";
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
             default:
                ret = "";

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
             default:
                ret = "";
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
             default:
                ret = "";
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
     
