
 datahandlerApp.service('CompareService', function($rootScope) {

    this.schoolList = [];
    this.numberOfSchools =0;
    this.schoolObject = [];
    this.readCount = 0;
    this.syncDataset = function($scope)
    {
        var self = this;
         $scope.schoolCompareData  = self.schoolObject;    
       $scope.numberOfSchoolsToCompare = self.numberOfSchools;
    }

    this.clean = function()
    {
        var self = this;
        self.schoolList = [];
        self.schoolObject = [];
    }

    this.removeSchoolfromCompare = function(school_id)
    {
        var self = this; 
        if(self.numberOfSchools > 0)
        {
            for(i = 0 ; i < self.numberOfSchools ; i++)
            {
                if(self.schoolList[i] == school_id)
                {
                     self.schoolList.splice(i, 1);  
                     self.schoolObject.splice(i, 1);

                     self.numberOfSchools --;
                     $rootScope.$broadcast('eventSchoolRemovedFromCompare');  
                    break;
                }
            }
        }
    }

    this.clearAllSchools = function ()
    {
        var self = this;
        self.schoolList == [];
        self.numberOfSchools = 0;
    }

    this.addSchoolToCompare = function(school_id)
    {
        var self = this;

        if(self.numberOfSchools < 3)
        {
            for(i = 0; i < self.schoolList ; i++)
            {
                if(self.schoolList[i] == school_id)
                {
                    console.log("School is already in the list of compare");
                    return false;
                }
            }

            self.schoolList.push(school_id);
            self.numberOfSchools ++;
            return true;
        }
        else
        {
            $rootScope.$broadcast('eventMaxNumberOfSchoolsReached');  
            //notify that number of schools to compare hase reached max 
            console.log("Max number of schools reached to compare ");
            return false;
        }

        
    }

    this.readAllSchools =function ()
    {
        var self = this;
        console.log("Number of schools to read "+ self.numberOfSchools);
        var self = this;
        self.schoolObject = [];
        self.readCount = 0;
        for (i = 0; i < self.numberOfSchools ; i++)
        {
            self.readSchoolData(self.schoolList[i]);
        }
    }

    this.notifyUI = function ()
    {
        var self = this ;
        if(self.readCount == self.numberOfSchools)
        {
            $rootScope.$broadcast('eventReadSchoolData');  
        }
    }


    this.readSchoolData = function(school_id)
    {
        console.log("read school data"+school_id);
        var self =this;
          $.ajax({
            type: "GET", 
            url: "api/search_api/search_id.php", 
            data: {"school_id" : school_id},
            success: function(response)
            {
                for (var i in response) 
                {
                    var school_data = new Object();   
                    school_data.principal_name          =   response[i].principal_name;
                    school_data.school_id               =   response[i].school_id;
                    school_data.name 		           = 	response[i].school_name;
                    school_data.address                 =   response[i].address;
                    school_data.session_timmings 	   =   getSessionTimingString        (parseInt(response[i].session_timmings));
                    school_data.city 				   =   response[i].city;
                    school_data.category 			   =   getCategoryString             (parseInt(response[i].category));  
                    school_data.school_type 		       =   response[i].school_type; 
                    school_data.courses 			       =   getCourseString               (parseInt(response[i].courses));
                    school_data.school_size 		       =   getSchoolSizeString           (parseInt(response[i].school_size));
                    school_data.board 				   =   getSchoolBoardString          (parseInt(response[i].board));
                    school_data.medium_of_teaching      =   getMediumOfTeachingString     (parseInt(response[i].medium_of_teaching));
                    school_data.religous_preference     =   getReligousPreferencesString  (parseInt(response[i].religous_preference));
                    school_data.small_description 	   =   response[i].small_description;
                    school_data.contact                 =   response[i].contact;
                    school_data.email                   =   response[i].email;
                    school_data.admission_description   =   response[i].admission_desciption;
                    school_data.average_rating_score    =   response[i].average_rating_score;
                    school_data.weblink                 =   response[i].web_link;                           
                    school_data.country                 =   response[i].country;
                    school_data.pin                     =   response[i].pin;
                    school_data.profile_pic_data        =   response[i].profile_pic_data;
                    school_data.mobility                =   response[i].mobility;
                    school_data.admission_method        =   getAdmissionMethodString      (parseInt(response[i].admission_method));     

                    self.schoolObject.push(school_data);
                    
                    self.readCount ++;

                    self.notifyUI();
                    break;
                } 
            },
            dataType: "json"//set to JSON    
        })      
    }


 });