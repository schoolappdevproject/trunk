
<?php

/*
API is used to save the reviews 
*/
include_once '../common/connection.php';
require("../trace/MyLogPHP-1.2.1.class.php");
$method = $_SERVER['REQUEST_METHOD'];
$log = new MyLogPHP();
if ($method == 'POST') {

    
    $user_id    = trim($_POST['user_id']);
    
    if(empty($user_id))
    {
       $log->info("HTTP/1.1 400 Bad Request");
        header("HTTP/1.1 400 Bad Request");    
    }
    else
    {
  
      $qry = "select pic from tbl_users where user_id = $user_id";
       
      $result = $database->query($qry)->fetchAll();
    
      $image_path = "../image_upload/".$result[0]['pic'];
        
      $imageData = file_get_contents($image_path);
        
      $src = 'data: '.mime_content_type($image_path).';base64,'.base64_encode($imageData);
      
      $image_ret['image'] = $src;
      
      echo json_encode($image_ret);
        
    }
      
} 
else
{
    $log->info("HTTP/1.1 400 Bad Request");
     header("HTTP/1.1 400 Bad Request");
}
?>
