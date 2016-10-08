<?php
include_once '../common/connection.php';
require("../trace/MyLogPHP-1.2.1.class.php");
$method = $_SERVER['REQUEST_METHOD'];
$log = new MyLogPHP();

if ($method == 'POST') {
    
    /*
       var formData = {
                      
                                id_school     : readCookie('school_id'),
                                user_id     :   dtl_user_id,
                                title         : $("#dtl_review_title").val(),
                                review_text   : $("#dtl_review_txt").val()
                                
                         };
    */
    
    
  $id_school      = $_POST['id_school'];
  $user_id        = $_POST['user_id'];
  $title          = $_POST['title'];
  $review_text    = $_POST['review_text'];
    
    
    //find $user_id

try{
    

      $ret = $database->insert('tbl_review_data', [
        'id_school'              => $id_school,
        'id_user_data'           => $user_id,
        'tbl_review_title'       => $title,
        'tbl_review_text'        => $review_text
      ]);

      if ($ret)
      {   
        $result['success'] = "review saved";
          $log->info("review saved");
      } else {
        $result['error'] = "Some thing wrong happend";
        $log->info(var_dump($database->error()));
     }
    
    
    $log->info("Review added in database for user $user_id school id  $id_school");
    
    $ret = $database->query("select id_review_data from tbl_review_data where id_user_data=$user_id order by id_review_data desc limit 1")->fetchAll();
    
    $result['review_id'] = $ret[0][0];    
    echo json_encode($result);

}
catch(Exception $e){
    $log->info($e->getMessage());
}

} else {
  header("HTTP/1.1 405 Method Not Allowed");
}

?>
