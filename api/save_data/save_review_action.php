<?php
include_once '../common/connection.php';
require("../trace/MyLogPHP-1.2.1.class.php");
$method = $_SERVER['REQUEST_METHOD'];
$log = new MyLogPHP();

if ($method == 'POST') {
    

  $review_id      = $_POST['review_id'];
  $user_id        = $_POST['user_id'];
  $action         = $_POST['user_action'];
  
  //find $user_id

try{
     
     $ret = $database->update("tbl_review_action",[
                'action' => $action
            ],[
                "AND" => [
                    'id_review_data[=]'  => $review_id,
                    'id_user[=]'    => $user_id
                ]
            ]);
    if(!$ret){
        $log->info(var_dump($database->error()));
    }
    
    
    $ret = $database->query("select count(*) from tbl_review_action where id_review_data = $review_id and action = 'L'")->fetchAll();
    
    $result = [];
    
    $result['total_liked'] = $ret[0][0];
    
    $ret = $database->query("select count(*) from tbl_review_action where id_review_data = $review_id and action = 'D'")->fetchAll();
    
    $result['total_disliked'] = $ret[0][0];
           
    echo json_encode($result);

}
catch(Exception $e){
    $log->info($e->getMessage());
}

} else {
  header("HTTP/1.1 405 Method Not Allowed");
}

?>
