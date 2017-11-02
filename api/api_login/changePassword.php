<?php

include_once '../common/connection.php';
require("../trace/MyLogPHP-1.2.1.class.php");
include_once 'mailconfig.php';
$log = new MyLogPHP();
$method = $_SERVER['REQUEST_METHOD'];

if ($method == 'POST') {


  /*

  data: {
                    "email"     :email,
                    "old_pass"  :old_pass,
                    "new_pass"   :new_pass

                    },
  */
  $email    = trim($_POST['email']);
  $old_pass = md5(trim($_POST['old_pass']));
  $new_pass = md5(trim($_POST['new_pass']));
  


  if(empty($email) || empty($old_pass) || empty($new_pass)){
    header("HTTP/1.1 400 Bad Request");
  } else {
    $result = [];
    $ret = $database->query("update tbl_users set password =$new_pass where email= $email and password = $old_pass");
    if($ret->rowCount() == 0)
    {
        $result['result'] = 0;
    }
    else 
    {
        $result['result'] = 1;

    }
    echo json_encode($result);
  }

?>
