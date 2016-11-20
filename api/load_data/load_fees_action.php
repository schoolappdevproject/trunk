
<?php

/*
API is used to save the reviews 
*/
include_once '../common/connection.php';
require("../trace/MyLogPHP-1.2.1.class.php");
$method = $_SERVER['REQUEST_METHOD'];
$log = new MyLogPHP();
if ($method == 'POST') {

    
    $fees_id    = trim($_POST['fees_id']);
    
    if(empty($fees_id))
    {
       $log->info("HTTP/1.1 400 Bad Request");
        header("HTTP/1.1 400 Bad Request");    
    }
    else
    {

      $qry = "select count(action) as count,action from tbl_fees_action where id_fees_data = $fees_id group by action"; 
       
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
