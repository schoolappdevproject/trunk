<?php
include_once '../common/connection.php';
require("../trace/MyLogPHP-1.2.1.class.php");
$method = $_SERVER['REQUEST_METHOD'];
$log = new MyLogPHP();

if ($method == 'POST') {

  $id_school      = $_POST['id_school'];
  $user_id        = $_POST['user_id'];
  $sports_rating  = $_POST['sports_rating'];
  $sports_rating_desc  = $_POST['sports_rating_desc'];
  $study_rating   = $_POST['study_rating'];
  $study_rating_desc   = $_POST['study_rating_desc'];
  $lab_rating     = $_POST['lab_rating'];
  $lab_rating_desc     = $_POST['lab_rating_desc'];
  $lib_rating     = $_POST['lib_rating'];
  $lib_rating_desc     = $_POST['lib_rating_desc'];
  $adm_rating     = $_POST['adm_rating'];
  $adm_rating_desc     = $_POST['adm_rating_desc'];


try{

      $ret = $database->insert('tbl_ratings_table', [
        'id_school'             => $id_school,
        'rating_type'           => "study",                  
        'user_id'               => $user_id,
        'rating_points'         => $study_rating,
        'child_id'              => $user_id,
        'rating_desc'           => $study_rating_desc,
        'rating_date'           => date("Y-m-d")
      ]);
    
    
      $ret = $database->insert('tbl_ratings_table', [
        'id_school'             => $id_school,
        'rating_type'           => "lib",                  
        'user_id'               => $user_id,
        'rating_points'         => $lib_rating,
        'child_id'              => $user_id,
        'rating_desc'           => $lib_rating_desc,
        'rating_date'           => date("Y-m-d")
      ]);

      $ret = $database->insert('tbl_ratings_table', [
        'id_school'             => $id_school,
        'rating_type'           => "sport",                  
        'user_id'               => $user_id,
        'rating_points'         => $sports_rating,
        'child_id'              => $user_id,
        'rating_desc'           => $sports_rating_desc,
        'rating_date'           => date("Y-m-d")
      ]);
    
      $ret = $database->insert('tbl_ratings_table', [
        'id_school'             => $id_school,
        'rating_type'           => "lab",                  
        'user_id'               => $user_id,
        'rating_points'         => $lab_rating,
        'child_id'              => $user_id,
        'rating_desc'           => $lab_rating_desc,
        'rating_date'           => date("Y-m-d")
      ]);
    
      $ret = $database->insert('tbl_ratings_table', [
        'id_school'             => $id_school,
        'rating_type'           => "teacher",                  
        'user_id'               => $user_id,
        'rating_points'         => $adm_rating,
        'child_id'              => $user_id,
        'rating_desc'           => $adm_rating_desc,
        'rating_date'           => date("Y-m-d")
      ]);
    
    
    
      if ($ret)
      {   
        $result['success'] = "review saved";
          $log->info("review saved");
      } else {
        $result['error'] = "Some thing wrong happend";
        $log->info(var_dump($database->error()));
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
