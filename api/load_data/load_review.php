
<?php

/*
API is used to save the reviews 
*/
include_once '../common/connection.php';
require("../trace/MyLogPHP-1.2.1.class.php");
$method = $_SERVER['REQUEST_METHOD'];
$log = new MyLogPHP();
if ($method == 'POST') {

    
      $school_id    = trim($_POST['school_id']);
    
    if(empty($school_id))
    {
       $log->info("HTTP/1.1 400 Bad Request");
        header("HTTP/1.1 400 Bad Request");    
    }
    else
    {

	$qry = "select tbl_review_data.id_review_data,".
	"tbl_review_data.review_date,".
	"tbl_review_data.tbl_review_title,".
	"tbl_review_data.tbl_review_text,".
    "tbl_review_action.action,".
	"tbl_users.username, ".
    "tbl_users.pic ".
	"from tbl_review_data,tbl_users,tbl_review_action  " .
	"where tbl_review_data.id_user_data = tbl_users.user_id ".
    "and tbl_review_data.id_user_data = tbl_review_action.id_user ".
	"and tbl_review_data.id_review_data = tbl_review_action.id_review_data ".
	"and tbl_review_data.id_school = $school_id";
       
     $result = $database->query($qry)->fetchAll();   
      echo json_encode($result);
        
    }
      
    
} 
else
{
    $log->info("HTTP/1.1 400 Bad Request");
     header("HTTP/1.1 400 Bad Request");
}
?>
