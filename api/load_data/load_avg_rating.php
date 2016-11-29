
<?php

/*
API is used to save the reviews 
*/
include_once '../common/connection.php';
require("../trace/MyLogPHP-1.2.1.class.php");
$method = $_SERVER['REQUEST_METHOD'];
$log = new MyLogPHP();
if ($method == 'POST') {

    
      $school_id    = trim($_POST['id_school']);
    
    if(empty($school_id))
    {
       $log->info("HTTP/1.1 400 Bad Request");
        header("HTTP/1.1 400 Bad Request");    
    }
    else
    {

     $qry = "select round(avg(rating_points)) as avg from tbl_ratings_table where id_school = '$school_id'";        
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
