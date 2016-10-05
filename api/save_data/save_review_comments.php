<?php
include_once '../common/connection.php';
require("../trace/MyLogPHP-1.2.1.class.php");
$method = $_SERVER['REQUEST_METHOD'];
$log = new MyLogPHP();

if ($method == 'POST') {
    
  $id_school      = $_POST['school_id'];

  $user_id        = $_POST['user_id'];
  $title          = $_POST['title'];
  $review_text    = $_POST['text_review'];
  $review_attach  = $_POST['id_review_atach'];
    
  //attachment 
    
  $file_name = $_POST['att_file_name'];
  $type      = $_POST['type'];
  $data      = $_POST['data'];

try
{
    
    
    $filepath = 'attachement_pic/'.$file_name.'.'.$type;    
    $log->info(file_put_contents($filepath, base64_decode($data)));

    //database save 
     $ret = $database->insert('tbl_review_attachment', [
        'attachment_path'     => $filepath,
         'attachment_type'    => $type
    ]);
    
    if ($ret) {
       $log->info("Profile Pictorial uploaded succesfully at path ".$filepath);       
    } else {
       $log->info("Profile Pictorial uploaded failed at path ".$filepath);       
    }
    
} 
catch(Exception $ex)
{
       $log->info(" Error : ".$ex->getMessage());
}
  
try{
      $school_id = $database->insert('tbl_review_data', [
        'id_school'              => $id_school,
        'id_user_data'           => $user_id,
        'tbl_review_title'       => $title,
        'tbl_review_text'        => $review_text
        'id_review_attachment'   => $review_attach 
      ]);

      if ($school_id)
      {   
        $result['success'] = "review Updated";
      } else {
        $result['error'] = "Some thing wrong happend";
        $log->info(var_dump($database->error()));
      }

}
catch(Exception $e){
    $log->info($e->getMessage());
}

} else {
  header("HTTP/1.1 405 Method Not Allowed");
}

?>
