
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
        
      //$result = [];
      //validating the user_id
      $qry = "select attach_data,attach_type from tbl_fees_attachment where id_fees = $fees_id;";
       
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
