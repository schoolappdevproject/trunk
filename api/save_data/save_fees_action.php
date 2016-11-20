<?php
include_once '../common/connection.php';
require("../trace/MyLogPHP-1.2.1.class.php");
$method = $_SERVER['REQUEST_METHOD'];
$log = new MyLogPHP();

if ($method == 'POST') {
    

  $fees_id     	  = $_POST['fees_id'];
  $user_id        = $_POST['user_id'];
  $action         = $_POST['user_action'];
  
  //find $user_id

try{
     
     $ret = $database->update("tbl_fees_action",[
                'action' => $action
            ],[
                "AND" => [
                    'id_fees_data[=]'  => $fees_id,
                    'id_user[=]'         => $user_id
                         ]
            ]);
    
    if($ret == false)
    {
        //in case a fresh user is doing like or dislike 
        //insert new row 
        $ret = $database->insert('tbl_fees_action', [
            'id_fees_data'      => $fees_id,
            'id_user'           => $user_id,
            'action'            => $action   
        ]);
        $log->info("Unable to update fees");
    }
   
    $ret = $database->query("select count(*) from tbl_fees_action where id_fees_data = $fees_id and action = 'L'")->fetchAll();
    
    $result = [];

    $result['total_liked'] = intval($ret[0][0]);
    
    $ret = $database->query("select count(*) from tbl_fees_action where id_fees_data = $fees_id and action = 'D'")->fetchAll();
    
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
