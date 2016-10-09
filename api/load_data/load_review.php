
<?php

/*
API is used to save the reviews 
*/
include_once 'connection.php';
require("../trace/MyLogPHP-1.2.1.class.php");
$method = $_SERVER['REQUEST_METHOD'];
$log = new MyLogPHP();
if ($method == 'POST') {

  $user_id      = trim($_POST['user_id']);
  $school_id    = trim($_POST['school_id']);
  $review_title = trim($_POST['review_title']);
  $review_text  = trim($_POST['review_text']);
 
    
    
    /*
    select tbl_review_data.review_date,tbl_review_data.tbl_review_title,tbl_review_data.tbl_review_text,tbl_users.username,
 tbl_likes_reviews.like_count ,tbl_dislike_table.dislike_count from tbl_review_data,tbl_users,tbl_likes_reviews
,tbl_dislike_table where tbl_review_data.id_user_data = tbl_users.user_id and tbl_review_data.id_review_data = tbl_likes_reviews.id_review and tbl_review_data.id_review_data = tbl_dislike_table.id_review;
    */
  
  if(empty($user_id) || empty($school_id))
  {
    $log->info("HTTP/1.1 400 Bad Request");
    header("HTTP/1.1 400 Bad Request");
  } 
  else
  {
    $result = [];
  
      //validating the user_id
      $validate_user = $database->get("tbl_users", [
       "user_name",
      ], [
       "user_id[=]" => $user_id;
      ]);
      
      $validate_school = $database->get("tbl_school_main_table", [
       "school_name",
      ], [
       "school_id[=]" => $school_id;
      ]);
        
    if($validate_user && $validate_school) {
        //insert the review in table
        $last_user_id = $database->insert("tbl_review_data", [
	       "id_school"         => $school_id,
	       "id_user_data"      => $user_id,
	       "tbl_review_title"  => $review_title,
	       "tbl_review_text"   => $review_text
        ]);
        $school_name            = $validate_school['school_name'];
        $username               = $validate_user['user_name'];
        $result['school_name']  = $school_name;
        $result['user_name']    = $username;
        $result['title']        = $review_title;
        $result['text']         = $review_text;
        
        
    } else {
      $log->info("Wrong User ID");
      header("HTTP/1.1 400 Bad Request");
    }
    
    $log->info($result);
    echo json_encode($result);
  }
} else {
  header("HTTP/1.1 405 Method Not Allowed");
}

?>
