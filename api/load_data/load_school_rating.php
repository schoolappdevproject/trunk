
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

	$qry = "select tbl_users.username,".
            "tbl_ratings_table.rating_type,".
            "tbl_ratings_table.rating_points,".
            "tbl_ratings_table.rating_desc,".
            "tbl_ratings_table.rating_date ".
            "from tbl_ratings_table,tbl_users where ".
            "tbl_ratings_table.user_id = tbl_users.user_id and tbl_ratings_table.id_school = $school_id";
 
       
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
