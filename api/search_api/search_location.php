<?php

include_once '../common/connection.php';
include_once '../common/database.php';
require("../trace/MyLogPHP-1.2.1.class.php");


$log = new MyLogPHP();

    /*
    latitude     : results[0].geometry.location.lat(),
    longitude    : results[0].geometry.location.lng()
    */
    $latitude   = $_POST['latitude'];
    $longitude  = $_POST['longitude'];
    
    $query = "select city_name from tbl_location where lat = $latitude and lng = $longitude";
    $log->info($query);    
    $result = $database->query($query)->fetchAll();
    
    $ret = [];
    $ret['exist'] = 'no';
    if(count($result) > 0)
    {
        $ret['exist'] = 'yes';
    }
    
    echo json_encode($ret);
      

?>

