
var profilePicData;

var logincompleted = false;
 

      function loginScript(e) {
         
        if (e.keyCode == 13) {
        loginUser();  //Fire Search event on Enter Click
            return true;
        }
     }

      function registerScript(e) {
       
        if (e.keyCode == 13) {
        registerUser();  //Fire Search event on Enter Click
            return true;
        }
     }
 
 $("#loginSubmit").click(function(){
              loginUser();
            });



$("#SaveReg").click(function(){
   registerUser();
});


function forgetPasswordClick()
{
      console.log("Forget Password");
    var email      = $('#frg_email').val();
    var old_pass   = $('#frg_oldpass').val();
    var new_pass   = $('#frg_newpass').val();
    var new_pass2   = $('#frg_reenterpass').val();

    if(new_pass != new_pass2)
    {
        alert("Please enter correct password");
        return;
    }


    $.ajax({
            type: "POST", 
            url: "api/api_login/registration.php", 
            data: {
                    "email"     :email,
                    "old_pass"  :old_pass,
                    "new_pass"   :new_pass

                    },
            success: function(response)
            {
                console.log(response);   
                var resultCode  ;
                resultCode  = 	response.code;
                    
                    console.log(resultCode);
                if(resultCode == "1")
                    {
                        
                        if (typeof(Storage) !== "undefined") {

                            localStorage.clear();
                            // Code for localStorage/sessionStorage.
                            var d = new Date();
                            var t = d.getTime();
                            localStorage.setItem("username", username);
                            localStorage.setItem("email", email);
                            localStorage.setItem("sessionid", email+t);
                            alert("Your registered successfully");
                            $('#myModal').modal('toggle');
                            // window.location.href = "user_profile.html";
                        } else {
                            console.log("Local storage not allowed ");
                        }
                    }
                else
                    {
                        alert(response.error);
                    }
                
            },
            dataType: "json"//set to JSON   

        }).fail(function( xhr, status, errorThrown ) {
                console.log( "Query Failed" );
                console.log( "Error: " + errorThrown );
                console.log( "Status: " + status );
                console.dir( xhr );
                return false;
        }); 

}


 function profilePicUloaded(input) {
                      
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
                
            var review_pic = new Object();
            review_pic.picData = e.target.result;
            $('#profilePicImage').attr('src', e.target.result);
            $('#profilePicImage').attr('hidden', false);
            $("#profilePicImage").show();
            profilePicData = review_pic;
        }

        reader.readAsDataURL(input.files[0]);
    }
}


function loginUser()
{
               
    var email = $('#loginEmail').val();
    var password = $('#loginPassword').val();

    if(email.length > 0 && password.length > 0)
    {
        localStorage.clear();
        login_util(email,password);
    }
    else
    {
        alert("Please enter proper user name and password");
    }  
  
  
}

function registerUser()
{
    console.log("Register");
    var name        = $('#reg_username').val();
    var email       = $('#reg_email').val();
    var mobile      = $('#reg_mobile').val();
    var password    = $('#reg_password').val();

    var profile_pic_data = "img/default-user-image.png";
    
    if(name.length > 0 && email.length > 0 && mobile.length > 0 && password.length > 0)
    {
        registration_util(name,email,password,mobile);
    }
    else 
    {   
        alert("Please Enter data correctly");
    }
}

function onSuccess(googleUser) {
    
  console.log('Logged in as: ' + googleUser.getBasicProfile().getName());
var profile = googleUser.getBasicProfile();
      console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
      console.log('Name: ' + profile.getName());
      console.log('Image URL: ' + profile.getImageUrl());
      console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
      localStorage.clear();
      googleSigning(profile.getName(),profile.getImageUrl(),profile.getEmail());
    
}
function onFailure(error) {
  console.log(error);
}
function renderButton() {
  gapi.signin2.render('my-signin', {
    'scope': 'profile email',
    'width': 240,
    'height': 50,
    'longtitle': true,
    'onsuccess': onSuccess,
    'onfailure': onFailure
  });
}

function signOut()
{
    var auth2 = gapi.auth2.getAuthInstance();
    auth2.signOut().then(function () {
        localStorage.clear();
      console.log('User signed out.');
      $.modal.close();
    });

    window.location.reload(true) 
}

function googleSigning(profileName,imageUrl,emailId)
{
  
   
     $.ajax({
        type: "POST", 
        url: "api/api_login/registerGoogle.php", 
        data: {
              "username" :profileName,
              "email"     :emailId,
              "picUrl" : imageUrl
              },
        success: function(response)
        {
              var resultCode  ;                     
              resultCode  = response;
            
            if(resultCode['success'] == "true")
                {
                      console.log(response);
                    console.log("Sucessfully login in google")
                    if (typeof(Storage) !== "undefined") {


                        localStorage.setItem("user_id", resultCode['user_id']);
                        // Code for localStorage/sessionStorage.
                        var d = new Date();
                        var t = d.getTime();
                        localStorage.setItem("username", profileName);
                        localStorage.setItem("email", emailId);
                        localStorage.setItem("sessionid", emailId+t);
                        localStorage.setItem("imageurl",imageUrl);
                         localStorage.setItem("isLogIn","true");
                        $('#usernameText').text(profileName);
                         $('#myModal').modal('hide');

                        if (typeof angular !== 'undefined') {
                              
                                angular.element(document.getElementById('searchController')).scope().setProfileName(profileName);
                        }

                       
                             
                       // window.location.href = "user_profile.html";
                    } else {
                        console.log("Local storage not allowed ");
                    }
                }

        },
        dataType: "json"//set to JSON    
    });    
    
    
}

function registration_util(username,email,password,mobile,profile_pic_data)
{
       
        console.log("register");
         $.ajax({
                    type: "POST", 
                    url: "api/api_login/registration.php", 
                    data: {"username" :username,
                          "email"     :email,
                          "password"  :password,
                           "mobile"   :mobile,
                           "profile_pic_data": profilePicData.picData
                          },
                    success: function(response)
                    {
                        console.log(response);   
                        var resultCode  ;
                        resultCode  = 	response.code;
                         
                         console.log(resultCode);
                        if(resultCode == "1")
                            {
                                
                                if (typeof(Storage) !== "undefined") {

                                    localStorage.clear();
                                    // Code for localStorage/sessionStorage.
                                    var d = new Date();
                                    var t = d.getTime();
                                    localStorage.setItem("username", username);
                                    localStorage.setItem("email", email);
                                    localStorage.setItem("sessionid", email+t);
                                    alert("Your registered successfully");
                                    $('#myModal').modal('toggle');
                                    localStorage.setItem("isLogIn","true");
                                   
                                   // window.location.href = "user_profile.html";
                                } else {
                                    console.log("Local storage not allowed ");
                                }
                            }
                        else
                            {
                                alert(response.error);
                            }
                        
                    },
                    dataType: "json"//set to JSON   

                }).fail(function( xhr, status, errorThrown ) {
                        console.log( "Query Failed" );
                        console.log( "Error: " + errorThrown );
                        console.log( "Status: " + status );
                        console.dir( xhr );
                        return false;
                }); 
}


function login_util(username,password)
{
      // Get some values from elements on the page:
   
     var   url = "api/api_login/login.php";

      // Send the data using post
      var posting = $.post( url, { username: username , password: password} );
        
     //  Put the results in a div
      posting.done(function( data ) {
          
       console.log(data);
       var dataObj = JSON.parse(data);

       console.log(dataObj.code);
          
       if(dataObj.code == "1")   //success
           {                  
               console.log("Successfull logged now settting localstorage");

               localStorage.clear();
                //save username and email in local storage and start a new sesssion with sesssion id 
                // session id would be username and time of login 
                if (typeof(Storage) !== "undefined") {
                    // Code for localStorage/sessionStorage.
                    var d = new Date();
                    var t = d.getTime();
                    localStorage.setItem("username", dataObj.username);
                    localStorage.setItem("email", dataObj.email);
                    localStorage.setItem("sessionid", dataObj.email+t);
                    localStorage.setItem("user_id", dataObj.user_id);
                    localStorage.setItem("imageurl",dataObj.pic);
                    localStorage.setItem("isLogIn","true");
                     $('#usernameText').text(dataObj.username);

                     $('#myModal').modal('toggle');

                    //if profile is not updated 
                    //login_success()

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
                        