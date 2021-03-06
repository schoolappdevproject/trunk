<?php
include_once '../common/connection.php';
require("../trace/MyLogPHP-1.2.1.class.php");
$method = $_SERVER['REQUEST_METHOD'];
$log = new MyLogPHP();
if ($method == 'POST') {
  $school_name          = $_POST['school_name'];
  $principal_name       = $_POST['principal_name'];
  $address              = $_POST['address'];
  $city                 = $_POST['city'];
  $email                = $_POST['email'];
  $country              = $_POST['country'];
  $pin                  = $_POST['pin'];
  $latitude             = $_POST['latitude'];
  $longitude            = $_POST['longitude'];
  $web_link             = $_POST['web_link'];
  $session_timings      = $_POST['session_timings'];
  $category             = $_POST['category'];
  $courses              = $_POST['courses'];
  $school_size          = $_POST['school_size'];
  $board                = $_POST['board'];
  $medium_of_teaching   = $_POST['medium_of_teaching'];
  $mobility             = $_POST['mobility'];
  $contact              = $_POST['contact'];
  $small_description    = $_POST['small_description'];
  $admission_description= $_POST['admission_description'];
  $religous_preference  = $_POST['religous_preference'];
  $admission_method     = $_POST['admission_method'];
  $profile_pic_data     = $_POST['profile_pic'];
  $profile_pic_name     = $_POST['profile_pic_name'];
  $admission_method     = $_POST['admission_method'];


try{

    $filepath = 'profile_pics/'.$profile_pic_name;

    
    $profile_pic_data = explode(',',$profile_pic_data);
    
   if(false ==  file_put_contents($filepath, base64_decode($profile_pic_data[1])))  
   {
       $filepath = "";
           $log->info("failed to save file ");
   }
   else
   {
        $filepath = "api/api_school_data/".$filepath;
   }


  $school_id = $database->insert('tbl_school_main_table', [
    'school_name'       => $school_name,
    'principal_name'    => $principal_name,
    'address'           => $address,
    'city'              => $city,
    'country'           => $country,
    'pin'               => $pin,
    'latitude'          => $latitude,
    'longitude'         => $longitude,
    'web_link'          => $web_link,
    'session_timmings'  => $session_timings,
    'category'          => $category,
    'courses'           => $courses,
    'school_size'       => $school_size,
    'board'             => $board,
    'medium_of_teaching'=> $medium_of_teaching,
    'mobility'          => $mobility,
    'contact'           => $contact,
    'small_description'          => $small_description,
    'admission_description'      => $admission_description,
    'religous_preference'        => $religous_preference,
    'profile_pic_data'           => $filepath,
    'admission_method'           => $admission_method,
    'email'                      => $email
  ]);


  if ($school_id) {
    $result['success'] = "School info added!";
  } else {
    $result['error'] = "Some thing wrong happend";
	var_dump($database->error());
  }


  echo json_encode($result);
}
catch(Exception $e){
    $log->info($e->getMessage());
}

} else {
  header("HTTP/1.1 405 Method Not Allowed");
}

?>
