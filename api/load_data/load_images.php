
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
        
      $qry = "select attachment_path from tbl_review_attachment where id_review = $review_id;";
       
      $result = $database->query($qry)->fetchAll();
        
//      $attach_path = 'attach_pic/'.$result['attachment_path'];

  //    $ret['path'] = $attach_path;
    
      echo json_encode($result);
        
    }
      
    
} 
else
{
    $log->info("HTTP/1.1 400 Bad Request");
     header("HTTP/1.1 400 Bad Request");
}
?>
