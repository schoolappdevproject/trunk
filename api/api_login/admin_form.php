<?php
include_once 'connection.php';
require("../trace/MyLogPHP-1.2.1.class.php");
$method = $_SERVER['REQUEST_METHOD'];
$log = new MyLogPHP();

if ($method == 'GET') {
  $school_name = $_GET['school_name'];
  $principal_name = $_GET['principal_name'];
  $address = $_GET['address'];
  $city = $_GET['city'];
  $country = $_GET['country'];
  $pin = $_GET['pin'];
  $latitude = $_GET['latitude'];
  $longitude = $_GET['longitude'];
  $web_link = $_GET['web_link'];
  $session_timings = $_GET['session_timings'];
  $category = $_GET['category'];
  $school_type = $_GET['school_type'];
  $courses = $_GET['courses'];
  $school_size = $_GET['school_size'];
  $board = $_GET['board'];
  $medium_of_teaching = $_GET['medium_of_teaching'];
  $mobility = $_GET['mobility'];
  $contact = $_GET['contact'];
  $small_description = $_GET['small_description'];
  $large_description = $_GET['large_description'];
  $average_rating_score = $_GET['average_rating_score'];

  $log->info("School information by <user_id><user name>");

  $school_id = $database->insert('tbl_school_main', [
    'school_name' => $school_name,
    'principal_name' => $principal_name,
    'address' => $address,
    'city' => $city,
    'country' => $country,
    'pin' => $pin,
    'latitude' => $latitude,
    'longitude' => $longitude,
    'web_link' => $web_link,
    'session_timings' => $session_timings,
    'category' => $category,
    'school_type' => $school_type,
    'courses' => $courses,
    'school_size' => $school_size,
    'board' => $board,
    'medium_of_teaching' => $medium_of_teaching,
    'mobility' => $mobility,
    'contact' => $contact,
    'small_description' => $small_description,
    'large_description' => $large_description,
    'average_rating_score' => $average_rating_score
  ]);

  if ($school_id) {
    $result['success'] = "School info added!";
  } else {
    $result['error'] = "Something went wrong! Please try again.!";
  }

  $log->info($result);

  echo json_encode($result);

} else {
  header("HTTP/1.1 405 Method Not Allowed");
}

?>
