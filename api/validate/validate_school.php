<?php
include_once '../common/connection.php';
require("../trace/MyLogPHP-1.2.1.class.php");
$method = $_SERVER['REQUEST_METHOD'];
$log = new MyLogPHP();

if ($method == 'POST') {
    
  $id_school      = $_POST['id_school'];
  $user_id      = $_POST['user_id'];

try{


    $ret = $database->select("tbl_student_table",[
      "student_id"
    ],[
        "AND" => [
            "student_id[=]" => $user_id,
            "school_id[=]" => $id_school
        ]
        
    ]);
    
    

    if ($ret)
    {   
        $result['success'] = "review Updated";
        $result['code'] = 1;
    } else {
        $result['error'] = "Some thing wrong happend";
        $log->info(var_dump($database->error()));
        $result['code'] = 0;
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
