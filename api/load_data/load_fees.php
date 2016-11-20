
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
        /*
        select tbl_fees_data.id_fees_data,          
        tbl_fees_data.review_date,
        tbl_fees_data.standard,
        tbl_fees_data.fees_txt,
        tbl_users.username 
            
            from tbl_fees_data,tbl_users where tbl_fees_data.user_id = tbl_users.user_id and tbl_fees_data.school_id = 1
        */
        
      //$result = [];
      //validating the user_id
      $qry = "select tbl_fees_data.id_fees_data, ".
        "tbl_fees_data.review_date,".
        "tbl_fees_data.standard,".
        "tbl_fees_data.fees_txt,".
        "tbl_users.username,".
        "tbl_users.pic,".
        "tbl_users.user_id ".
        "from tbl_fees_data,tbl_users where tbl_fees_data.user_id = tbl_users.user_id and tbl_fees_data.school_id  = $school_id";
       
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
