<?php

include_once '../common/connection.php';
include_once '../common/database.php';
require("../trace/MyLogPHP-1.2.1.class.php");


$log = new MyLogPHP();


    
    $query = "SELECT school_id, school_name FROM tbl_school_main_table";
    $log->info($query);    
    $result = $database->query($query)->fetchAll();
    $sdata = array();

    for($i = 0; $i < count($result); $i++)
    {
        $school_data = new School_main_table();
        $school_data->school_id              = $result[$i][0];
        $school_data->school_name            = $result[$i][1];

        array_push($sdata,$school_data);
    }
    $log->info(json_encode($sdata));    
    echo json_encode($sdata);


        

?>

