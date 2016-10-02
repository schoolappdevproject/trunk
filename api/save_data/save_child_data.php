<?php
include_once '../common/connection.php';
require("../trace/MyLogPHP-1.2.1.class.php");
$method = $_SERVER['REQUEST_METHOD'];
$log = new MyLogPHP();
if ($method == 'POST') {
    
    /*
                   var formData = {
                            child_name     : child_name,
                            child_age      : child_age,
                            user_name      : user_name,
                         };
    */
    
  $child_name  = $_POST['child_name'];
  $child_age   = $_POST['child_age'];
  $user_name   = $_POST['user_name'];
  
    

try{
    
    $validate_user = $database->get("tbl_users",[
      "user_id"
    ],[
        "username" => $user_name
    ]);
    
     if(!$validate_user){
      $log->info(var_dump($database->error()));
      }
    
    $user_id = $validate_user['user_id'];
    
    
    
  $ret = $database->get('tbl_child_table', [
        "child_id" , 
        "child_name"
  ],[
	   "user_id[=]" => $user_id ,
       "child_name[=]" => $child_name
   ]);
    
     if(!$ret){
      $log->info(var_dump($database->error()));
      }

    if($ret['child_name'] == $child_name)
    {
        //its already in database
        //update command
        $log->info("Child data already there ");
        $ret = $database->update('tbl_child_table', [
        
              'child_name'   => $child_name,
                'child_age'  => $child_age
                
          ],[
            "user_id[=]" => $user_id ,
              "child_name[=]" => $child_name
           ]);
        
        if(!$ret){
          $log->info(var_dump($database->error()));
        }
        $log->info("Updating child data  child name ". $child_name." Child age ".$child_age);
        
    }
    else
    {   //new child added
    
        $log->info("Child data does not exit ");
        $ret = $database->insert('tbl_child_table', [
            'user_id'   => $user_id,
            'child_name'=> $child_name,
            'age'       => $child_age
          ]);
        
       if(!$ret){
           $log->info(var_dump($database->error()));
         }
        $log->info("inserting child data  child name ". $child_name." Child age ".$child_age);
    
    }
    
    /*
     $ret = $database->select('tbl_child_table', [
              "child_id"
          ],[
            "user_id[=]" => $user_id ,
              "child_name[=]" => $child_name
           ]);
    */
    
    //$ret = $database->query("SELECT child_id FROM tbl_child_table ORDER BY child_id DESC LIMIT 1")->fetchAll();
            
    /*if(!$ret){
        $log->info(var_dump($database->error()));
     }*/
    //$result['child_id']    = $ret[0]['child_id'];
    
    $result['child_id']    = '23';
    
    $log->info("child id : --"+  $result['child_id'] );
    
    echo json_encode($result);
  
 
}
catch(Exception $e){
    $log->info($e->getMessage());
}

} else {
  header("HTTP/1.1 405 Method Not Allowed");
}

?>
