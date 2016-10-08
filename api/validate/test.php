<?php
include_once '../common/connection.php';
require("../trace/MyLogPHP-1.2.1.class.php");
$log = new MyLogPHP();

                
   
    
    
    $ret = $database->query("select id_review_data from tbl_review_data where id_user_data=21 order by id_review_data desc limit 1")->fetchAll();
    
    $result['review_id'] = $ret[0][0];
    

    
    echo json_encode($result);


?>
