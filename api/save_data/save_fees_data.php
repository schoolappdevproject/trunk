<?php
include_once '../common/connection.php';
require("../trace/MyLogPHP-1.2.1.class.php");
$method = $_SERVER['REQUEST_METHOD'];
$log = new MyLogPHP();

if ($method == 'POST') {
    
   
    
  $id_school      = $_POST['id_school'];
  $user_id        = $_POST['user_id'];
  $standard       = $_POST['standard'];
  $fees_text      = $_POST['fees_text'];
    
    
    //find $user_id

try{
  
      $ret = $database->insert('tbl_fees_data', [
        'user_id'        => $user_id,
        'school_id'      => $id_school,
        'standard'       => $standard,
        'fees_txt'      =>  $fees_text,
        'review_date'    => date("Y-m-d")
      ]);

      if ($ret)
      {   
        $result['success'] = "review saved";
          $log->info("review saved");
      } else {
        $result['error'] = "Some thing wrong happend";
        $log->info(var_dump($database->error()));
     }

    $log->info("fees added in database for user $user_id school id  $id_school");
    
    $ret = $database->query("select id_fees_data from tbl_fees_data where user_id=$user_id order by id_fees_data desc limit 1")->fetchAll();
    
    $result['fees_id'] = $ret[0][0];    
    
    $review_id = $ret[0][0]; 
    
    echo json_encode($result);

}
catch(Exception $e){
    $log->info($e->getMessage());
}

} else {
  header("HTTP/1.1 405 Method Not Allowed");
}

?>
