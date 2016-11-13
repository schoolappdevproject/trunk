<?php

include_once '../common/connection.php';
include_once '../common/database.php';
require("../trace/MyLogPHP-1.2.1.class.php");


$log = new MyLogPHP();


if (isset($_GET['school_id'])){
    
    $log->info("Term :".$_GET['school_id']);
    $query = "SELECT school_id, principal_name, contact,email,admission_description,average_rating_score,web_link,country,pin, address, school_name, latitude, longitude ,city, session_timmings,category,school_type,courses,school_size,board, medium_of_teaching, mobility, small_description,religous_preference,profile_pic_data,admission_method,mobility FROM tbl_school_main_table where school_id ='".$_GET['school_id']."'";
    $log->info($query);    
    $result = $database->query($query)->fetchAll();
    $sdata = array();

    for($i = 0; $i < count($result); $i++)
    {
        $school_data = new School_main_table();
        $school_data->school_id              = $result[$i][0];
        $school_data->principal_name         = $result[$i][1];
        $school_data->contact                = $result[$i][2];
        $school_data->email                  = $result[$i][3];
        $school_data->admission_description  = $result[$i][4];
        $school_data->average_rating_score   = $result[$i][5];
        $school_data->web_link               = $result[$i][6];
        $school_data->country                = $result[$i][7];
        $school_data->pin                    = $result[$i][8];
        $school_data->address                = $result[$i][9];
        $school_data->school_name            = $result[$i][10];
        $school_data->latitude               = $result[$i][11];
        $school_data->longitude              = $result[$i][12];
        $school_data->city                   = $result[$i][13];
        $school_data->session_timmings       = $result[$i][14];
        $school_data->category               = $result[$i][15];
        $school_data->school_type            = $result[$i][16];
        $school_data->courses                = $result[$i][17];
        $school_data->school_size            = $result[$i][18];
        $school_data->board                  = $result[$i][19];
        $school_data->medium_of_teaching     = $result[$i][20];
        $school_data->mobility               = $result[$i][21];
        $school_data->small_description      = $result[$i][22];
        $school_data->religous_preference    = $result[$i][23];
        $school_data->profile_pic_data       = base64_decode($result[$i][24]);
        $school_data->admission_method       = $result[$i][25];
        
        $log->info($school_data->admission_method);
        
        
        $school_data->mobility               = $result[$i][26];
        array_push($sdata,$school_data);
    }
    
    echo json_encode($sdata);
}


        

?>

