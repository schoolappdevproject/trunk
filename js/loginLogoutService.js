datahandlerApp.service('LoginLogoutService', function($rootScope) {

    this.isLogin = false;
    this.username = "false"

    this.getLoginStatus = function()
    {
        var self = this;
        self.isLogin =  localStorage.getItem("isLogIn");
        if(self.isLogin == true)
        {
            return true;
        }
        else 
        {
            return false;
        }
    }

    this.getUser = function()
    {
        var self = this;
        self.username = localStorage.getItem("username");
        return self.username;
    }

    this.login = function(username,password)
    {
        var self = this;
        self.isLogin = true;
        loginUser();
    }

    this.logout = function()
    {
        var self = this ;
        self.isLogin = false;
        signOut();
    }




 });