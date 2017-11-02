<?php

include_once '../common/connection.php';
require("../trace/MyLogPHP-1.2.1.class.php");

$log = new MyLogPHP();

if (isset($_POST['term'])){


     $session_timing    =  ($_POST['session_timing'] == "-1") ? "" : " session_timmings ='".strval($_POST['session_timing'])."' and " ;
     $category          =  ($_POST['category'] == "-1") ? "" :  " category = '".strval($_POST['category'])."' and ";
     $course            =  ($_POST['course'] == "-1") ? "" : " courses = '".strval($_POST['course'])."' and "; ;
     $school_size       =  ($_POST['school_size'] == "-1") ? "" :" school_size ='".strval($_POST['school_size'])."' and ";
     $school_board      =  ($_POST['school_board'] == "-1") ? "" : " board = '".strval($_POST['school_board'])."' and ";
     $medium            =  ($_POST['medium'] == "-1") ? "" :   " medium_of_teaching = '".strval($_POST['medium'])."' and ";
     $adm_method        =  ($_POST['adm_method'] == "-1") ? "" : " admission_method = '".strval($_POST['adm_method'])."' and "  ;
     $religous          =  ($_POST['religous'] == "-1") ? "" : " religous_preference = '".strval($_POST['religous'])."' and ";
    
     
    $query = "SELECT DISTINCT school_name, school_id FROM tbl_school_main_table where".$session_timing.$category.$course.$school_size.$medium.$school_board.$adm_method.$religous." school_name LIKE '%".$_POST['term']."%'";
    $log->info($query); 

    $result = $database->query($query)->fetchAll();
    
    $ret = array();
    for($i = 0; $i < count($result); $i++)
    {
        array_push($ret,$result[$i]);
    }
    
    $log->info(json_encode($ret));    
    echo json_encode($ret);
}


//SELECT DISTINCT school_name FROM tbl_school_main_table where admission_method = 1 and board = 1 and category = 1 and courses = 1 and medium_of_teaching = 1 and religous_preference = 1 and session_timmings =1

         
///$query = "SELECT address, school_name, latitude, longitude ,city, session_timmings,category,school_type,courses,school_size,board, medium_of_teaching, mobility, small_description,religous_preference FROM tbl_school_main_table";

?>

