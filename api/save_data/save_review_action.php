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
   
    $ret = $database->query("update tbl_review_action set action ='$action' where id_review_data = $review_id and id_user = $user_id");
    if($ret->rowCount() == 0)
    {
        $ret = $database->query("select count(*) from tbl_review_action where id_review_data = $review_id and action = '$action' and id_user = $user_id")->fetchAll();
            if(!$ret)
            {
                        //in case a fresh user is doing like or dislike 
                //insert new row 
                $ret = $database->insert('tbl_review_action', [
                    'id_review_data'    => $review_id,
                    'id_user'           => $user_id,
                    'action'            => $action   
                ]);

            }
    }
   
    $ret = $database->query("select count(*) from tbl_review_action where id_review_data = $review_id and action = 'L'")->fetchAll();
    
    $result = [];

    $result['total_liked'] = intval($ret[0][0]);
    
    $ret = $database->query("select count(*) from tbl_review_action where id_review_data = $review_id and action = 'D'")->fetchAll();
    
    $result['total_disliked'] = intval($ret[0][0]);
    
    $log->info(json_encode($result));
           
    echo json_encode($result);

}
catch(Exception $e){
    $log->info($e->getMessage());
}

} else {
  header("HTTP/1.1 405 Method Not Allowed");
}

?>
