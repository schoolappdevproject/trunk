
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
      $type         = trim($_POST['type']);
    
    if(empty($review_id))
    {
       $log->info("HTTP/1.1 400 Bad Request");
        header("HTTP/1.1 400 Bad Request");    
    }
    else
    {

      $qry = "select count(action) as count,action from tbl_review_action where id_review_data = $review_id group by action"; 
       
      $log->info($qry);
      $result = $database->query($qry)->fetchAll();
      $log->info($result[0]['count']);
      echo json_encode($result);
        
    }
      
    
} 
else
{
    $log->info("HTTP/1.1 400 Bad Request");
     header("HTTP/1.1 400 Bad Request");
}
?>
