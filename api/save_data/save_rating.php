<?php
include_once '../common/connection.php';
require("../trace/MyLogPHP-1.2.1.class.php");
$method = $_SERVER['REQUEST_METHOD'];
$log = new MyLogPHP();

if ($method == 'POST') {

  $id_school      = $_POST['id_school'];
  $user_id        = $_POST['user_id'];
  $rating_heading = $_POST['rating_heading'];
  $rating_desc    = $_POST['rating_desc'];
  $rating_value   = $_POST['rating_value'];

try{

      $ret = $database->insert('tbl_ratings_table', [
        'id_school'             => $id_school,
        'rating_type'           => "gen",  //general Rating    
        'rating_title'          => $rating_heading,              
        'user_id'               => $user_id,
        'rating_points'         => $rating_value,
        'child_id'              => $user_id,
        'rating_desc'           => $rating_desc,
        'rating_date'           => date("Y-m-d")
      ]);
       
      if ($ret)
      {   
        $result['success'] = "1";
        $log->info("review saved");
      
      } else {
        $result['success'] = "0";
        $result['error'] = var_dump($database->error());
        $log->info(var_dump($database->error()));
     }
    
    echo json_encode($result);

}
catch(Exception $e){
    $log->info($e->getMessage());
}

} else {
  header("HTTP/1.1 405 Method Not Allowed");
}

?>
