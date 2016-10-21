<?php  
class School_main_table {
    
    public $school_id = "";
    public $principal_name = "";
    public $address = "";
    public $school_name = "";
    public $latitude = "";
    public $longitude = "";
    public $city = "";
    public $session_timmings = "";
    public $category = "";
    public $school_type = "";
    public $courses = "";
    public $school_size = "";
    public $board = "";
    public $medium_of_teaching = "";
    public $mobility = "";
    public $small_description = "";
    public $religous_preference = "";
    public $contact = "";
    public $email = "";
    public $admission_description ="";
    public $average_rating_score ="";
    public $web_link ="";
    
    public $country ="";
    public $pin ="";
    public $profile_pic_data ="";
   }


    function getDataSet($result)
    {
        
        $sdata = array();

        for($i = 0; $i < count($result); $i++)
        {
            $school_data = new School_main_table();
            $school_data->school_id = $result[$i][0];
            $school_data->address = $result[$i][1];
            $school_data->school_name = $result[$i][2];
            $school_data->latitude = $result[$i][3];
            $school_data->longitude = $result[$i][4];
            $school_data->city = $result[$i][5];
            $school_data->session_timmings = $result[$i][6];
            $school_data->category = $result[$i][7];
            $school_data->school_type = $result[$i][8];
            $school_data->courses = $result[$i][9];
            $school_data->school_size = $result[$i][10];
            $school_data->board = $result[$i][11];
            $school_data->medium_of_teaching = $result[$i][12];
            $school_data->mobility = $result[$i][13];
            $school_data->small_description = $result[$i][14];
            $school_data->religous_preference = $result[$i][15];
            $school_data->profile_pic_data =  $result[$i][16];
            array_push($sdata,$school_data);
        }
        return $sdata;
    }
?>


