<?php

include_once '../common/connection.php';
include_once '../common/database.php';
require("../trace/MyLogPHP-1.2.1.class.php");


$log = new MyLogPHP();


if (isset($_GET['school_name'])){
    
    $log->info("Term :".$_GET['school_name']);
    $query = "SELECT school_id, address, school_name, latitude, longitude ,city, session_timmings,category,school_type,courses,school_size,board, medium_of_teaching, mobility, small_description,religous_preference,profile_pic_data FROM tbl_school_main_table where school_name LIKE '%".$_GET['school_name']."%'";
    $log->info($query);    
    $result = $database->query($query)->fetchAll();
    $sdata = getDataSet($result);
    $log->info(json_encode($sdata));    
    echo json_encode($sdata);
}

        

?>

