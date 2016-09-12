<?php

include_once '../common/connection.php';
require("../trace/MyLogPHP-1.2.1.class.php");

$log = new MyLogPHP();

if (isset($_GET['term'])){
    
    $query = "SELECT DISTINCT school_name FROM tbl_school_main_table where school_name LIKE '%".$_GET['term']."%'";
    $log->info($query);    
    $result = $database->query($query)->fetchAll();
    
    $ret = array();
    for($i = 0; $i < count($result); $i++)
    {
        array_push($ret,$result[$i][0]);
    }
    
    $log->info(json_encode($ret));    
    echo json_encode($ret);
}

         
///$query = "SELECT address, school_name, latitude, longitude ,city, session_timmings,category,school_type,courses,school_size,board, medium_of_teaching, mobility, small_description,religous_preference FROM tbl_school_main_table";

?>

