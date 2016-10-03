<?php 

	include_once '../common/connection.php';
	require("../trace/MyLogPHP-1.2.1.class.php");

   $ret = $database->query("SELECT child_id FROM tbl_child_table ORDER BY child_id DESC LIMIT 1;")->fetchAll();
            
    if(!$ret){
        $log->info(var_dump($database->error()));
     }
    $result['child_id']    = $ret[0]['child_id'];
    
    echo json_encode($result);

?>
