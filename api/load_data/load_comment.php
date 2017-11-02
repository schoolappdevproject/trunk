
<?php

/*
API is used to save the reviews 
*/
include_once '../common/connection.php';
require("../trace/MyLogPHP-1.2.1.class.php");
$method = $_SERVER['REQUEST_METHOD'];
$log = new MyLogPHP();
if ($method == 'POST') {
  
    $review_id    = trim($_POST['review_id']);
    
    if(empty($review_id))
    {
       $log->info("HTTP/1.1 400 Bad Request");
        header("HTTP/1.1 400 Bad Request");    
    }
    else
    {

	$qry = "SELECT tbl_comments_table.user_id,tbl_users.username, tbl_users.pic, tbl_comments_table.comment_text,tbl_comments_table.date_time FROM tbl_comments_table , tbl_users where id_blog ='".$review_id."' and tbl_comments_table.user_id = tbl_users.user_id";
       
    $log->info($qry);
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
