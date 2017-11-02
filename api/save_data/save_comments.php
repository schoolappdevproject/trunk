
<?php
include_once '../common/connection.php';
require("../trace/MyLogPHP-1.2.1.class.php");
$method = $_SERVER['REQUEST_METHOD'];
$log = new MyLogPHP();

if ($method == 'POST') {
    
    /*
         var formData = {
                user_id       : user_id,
                review_id     : review_id,
                comment       : comment
            };

    */
    
    
  $review_id      = $_POST['review_id'];
  $user_id        = $_POST['user_id'];
  $comment        = $_POST['comment'];
    
    
    //find $user_id

try{
    
      $ret = $database->insert('tbl_comments_table', [
        'id_blog'              => $review_id,
        'user_id'               => $user_id,
        'comment_text'           => $comment,
        'date_time'            => date("Y-m-d H:i:s")
      ]);

      if ($ret)
      {   
        $result['success'] = 0;
          $log->info("review saved");
      } else {
        $result['success'] = 1;
        $result['reason'] = var_dump($database->error());
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

