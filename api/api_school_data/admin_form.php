<?php
include_once '../common/connection.php';
require("../trace/MyLogPHP-1.2.1.class.php");
$method = $_SERVER['REQUEST_METHOD'];
$log = new MyLogPHP();
if ($method == 'POST') {
  $school_name      = $_POST['school_name'];
  $principal_name   = $_POST['principal_name'];
  $address          = $_POST['address'];
  $city             = $_POST['city'];
  $email            = $_POST['email'];
  $country          = $_POST['country'];
  $pin              = $_POST['pin'];
  $latitude         = $_POST['latitude'];
  $longitude        = $_POST['longitude'];
  $web_link         = $_POST['web_link'];
  $session_timings  = $_POST['session_timings'];
  $category         = $_POST['category'];
//  $school_type      = $_POST['school_type'];  -->
  $courses          = $_POST['courses'];
  $school_size      = $_POST['school_size'];
  $board            = $_POST['board'];
  $medium_of_teaching= $_POST['medium_of_teaching'];
  $mobility          = $_POST['mobility'];
  $contact           = $_POST['contact'];
  $small_description = $_POST['small_description'];
  //$large_description = $_POST['large_description'];
  $religous_preference = $_POST['religous_preference'];
  $admission_method      = $_POST['admission_method'];
    
    

                   //   'admission_method'          : $('input[name=admission_method]:checked').val(),
                     
//  $average_rating_score = $_POST['average_rating_score'];
 $average_rating_score = 0;
 

try{
  $school_id = $database->insert('tbl_school_main_table', [
    'school_name'       => $school_name,
    'principal_name'    => $principal_name,
    'address'           => $address,
    'city' => $city,
    'country' => $country,
    'pin' => $pin,
    'latitude' => $latitude,
    'longitude' => $longitude,
    'web_link' => $web_link,
    'session_timmings' => $session_timings,
    'category' => $category,
//    'school_type' => $school_type,
    'courses' => $courses,
    'school_size' => $school_size,
    'board' => $board,
    'medium_of_teaching' => $medium_of_teaching,
    'mobility' => $mobility,
    'contact' => $contact,
    'small_description' => $small_description,
    //'large_description' => $large_description,
    'average_rating_score' => $average_rating_score,
    'religous_preference' => $religous_preference
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
