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
        "username" => $username
    ]);
    
    $user_id = $validate_user['user_id'];
    
    
    
  $ret = $database->get('tbl_child_table', [
        "child_id" , 
        "child_name"
  ],[
	   "user_id[=]" => $user_id ,
       "child_name[=]" => $child_name
   ]);

    if($ret == $child_name)
    {
        //its already in database
        //update command
        
        $ret = $database->update('tbl_child_table', [
        
              'child_name'   => $child_name,
                'child_age'  => $child_age
                
          ],[
            "user_id[=]" => $user_id ,
              "child_name[=]" => $child_name
           ]);
        
    }
    else
    {   //new child added
    
        $ret = $database->insert('tbl_child_table', [
            'user_id'   => $user_id,
            'child_name'=> $child_name,
            'age'       => $child_age
          ]);
        
        
        $ret = $database->get('tbl_child_table', [
              'child_id'
          ],[
            "user_id[=]" => $user_id ,
              "child_name[=]" => $child_name
           ]);
        
        
        $result['child_id']    = $ret['child_id'];
        echo json_encode($result);
    }

  
 
}
catch(Exception $e){
    $log->info($e->getMessage());
}

} else {
  header("HTTP/1.1 405 Method Not Allowed");
}

?>
