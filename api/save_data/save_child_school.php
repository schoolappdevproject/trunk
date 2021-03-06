<?php
include_once '../common/connection.php';
require("../trace/MyLogPHP-1.2.1.class.php");
$method = $_SERVER['REQUEST_METHOD'];

/*

 var formData = {
                      
                                id             : school_data_arr[school_data_i].id,
                                name           : school_data_arr[school_data_i].name,
                                std            : school_data_arr[school_data_i].std,
                                rate_study     : school_data_arr[school_data_i].rate_study,
                                rate_lab       : school_data_arr[school_data_i].rate_lab,
                                rate_sports    : school_data_arr[school_data_i].rate_sports,
                                rate_lib       : school_data_arr[school_data_i].rate_lib,
                                rate_teacher   : school_data_arr[school_data_i].rate_teacher,
                                period_start   : school_data_arr[school_data_i].period_start,
                                period_end     : school_data_arr[school_data_i].period_end,
                                brief_intro    : school_data_arr[school_data_i].brief_intro,
                                admin_intro    : school_data_arr[school_data_i].admin_intro,
                                username       : user_info.username
                         };

*/

$log = new MyLogPHP();
if ($method == 'POST') {
  $id             = $_POST['id']; //school id
  $name           = $_POST['name'];
  $std            = $_POST['std'];
  $rate_study     = $_POST['rate_study'];
  $rate_lib       = $_POST['rate_lib'];
  $rate_sports    = $_POST['rate_sports'];
  $rate_teacher   = $_POST['rate_teacher'];
  $period_start   = $_POST['period_start'];
  $period_end     = $_POST['period_end'];
  $brief_intro    = $_POST['brief_intro'];
  $admin_intro    = $_POST['admin_intro'];
  $username       = $_POST['username'];

try{
    
    $validate_user = $database->get("tbl_users",[
      "user_id"
    ],[
        "username" => $username
    ]);
    
    if(!$validate_user){
            $log->info(var_dump($database->error()));
    }
    
    $user_id = $validate_user['user_id'];
    
    //check whether entry already there
    
    $ret = $database->get("tbl_student_table",[
        "student_id"
    ],[
        "student_id[=]" => $user_id
    ]);
    
    if(!$ret){
            $log->info(var_dump($database->error()));
         }
    
    
    if($ret['student_id'] == $user_id)
    {
        //entry already there update command nedded
        
         $ret = $database->update("tbl_student_table",[
                'current_std'   => $std,
                'period_start'  => $period_start,
                'period_end'    => $period_end,
                'school_id'     => $id
            ],[
                "student_id[=]" => $user_id
            ]);
         if(!$ret){
           $log->info(var_dump($database->error()));
         }
    }
    else 
    {
        $ret = $database->insert('tbl_student_table', [
        'student_id'    => $user_id,
        'current_std'   => $std,
        'period_start'  => $period_start,
        'period_end'    => $period_end,
        'school_id'     => $id
      ]);
        
         if(!$ret){
           $log->info(var_dump($database->error()));
         }
       
    }
    
    
    
    $ret = $database->get("tbl_ratings_table",[
        "child_id"
    ],[
        "AND" => [
                "id_school[=]" => $id,
                "child_id[=]"  => $user_id    
        ]
        
    ]);
    
     if(!$ret){
           $log->info(var_dump($database->error()));
         }
     
    if($ret['child_id'] == $user_id)
    {
        
        $ret = $database->update("tbl_ratings_table",[
            'rating_points'=>$rate_teacher
        ],[
            "AND" => [
                    "rating_type[=]"  => "teacher",
                    "id_school[=]"    => $id,
                    "child_id[=]"     => $user_id    
                ]
            
        ]);
        
         if(!$ret){
             $log->info(var_dump($database->error()));
         }
        
        
        $ret = $database->update("tbl_ratings_table",[
               'rating_points'=>$rate_study
            ],[
            
                    "AND" => [
                        "rating_type[=]"  => "study",
                        "id_school[=]"    => $id,
                        "child_id[=]" => $user_id
                    ]
            
            ]);
        
        
        $ret = $database->update("tbl_ratings_table",[
                'rating_points'=>$rate_lib
            ],[
            
            "AND" =>[
                "rating_type[=]"  => "lib",
                "id_school[=]"    => $id,
                "child_id[=]"     => $user_id
                ]
            ]);
        
         if(!$ret){
             $log->info($database->error());
         }
        
        $ret = $database->update("tbl_ratings_table",[
                "rating_points" =>$rate_sports
                
            ],[
            
            "AND" => [
                "rating_type[=]"  => "sport",
                "id_school[=]"    => $id,
                "child_id[=]" => $user_id
                ]
            ]);
        
         if(!$ret){
             $log->info($database->error());
         }
        
    }
    else 
    {
        
     $ret = $database->insert('tbl_ratings_table', [
        'id_school'    => $id,
        'rating_type'  => "study",
        'user_id'      => $user_id,
        'child_id'     => $user_id,
        'rating_points'=>$rate_study
      ]);
        
         if(!$ret){
             $log->info($database->error());
         }
    
    $ret = $database->insert('tbl_ratings_table', [
        'id_school'    => $id,
        'rating_type'  => "lib",
        'user_id'      => $user_id,
        'child_id'     => $user_id,
        'rating_points'=>$rate_lib
      ]);
        
         if(!$ret){
             $log->info($database->error());
         }
    
    
     $ret = $database->insert('tbl_ratings_table', [
        'id_school'    => $id,
        'rating_type'  => "sport",
        'user_id'      => $user_id,
        'child_id'     => $user_id,
        'rating_points'=>$rate_sports
      ]);
        
        
         if(!$ret){
             $log->info(var_dump($database->error()));
         }
    
     $ret = $database->insert('tbl_ratings_table', [
        'id_school'    => $id,
        'rating_type'  => "teacher",
        'user_id'      => $user_id,
        'child_id'     => $user_id,
        'rating_points'=>$rate_teacher
      ]);
        
        
         if(!$ret){
             $log->info($database->error());
         }

    }
    
    //add review comment 
    //brief review
    
      $ret = $database->insert('tbl_review_data', [
        'id_school'         => $id,
        'id_user_data'      => $user_id,
        'tbl_review_title'  => "Brief Introduction",
        'tbl_review_text'   => $brief_intro
      ]);
    
     if(!$ret){
             $log->info($database->error());
         }
    
    //admsion review
    
      $ret = $database->insert('tbl_review_data', [
        'id_school'         => $id,
        'id_user_data'      => $user_id,
        'tbl_review_title'  => "Admission Introduction",
        'tbl_review_text'   => $admin_intro
      ]);
    
     if(!$ret){
             $log->info($database->error());
         }
    
 
}
catch(Exception $e){
    $log->info($e->getMessage());
}

} else {
  header("HTTP/1.1 405 Method Not Allowed");
}

?>
