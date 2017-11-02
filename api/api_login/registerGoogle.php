<?php

include_once '../common/connection.php';
require("../trace/MyLogPHP-1.2.1.class.php");
include_once 'mailconfig.php';
$log = new MyLogPHP();
$method = $_SERVER['REQUEST_METHOD'];

$log->info("Register google file ");
if ($method == 'POST') {
    
  $username = trim($_POST['username']);
  $email    = trim($_POST['email']);
  $picUrl =   trim($_POST['picUrl']);
    
  if(empty($username) || empty($email)) {
    header("HTTP/1.1 400 Bad Request");
  } else {
    $result = [];
      
    $duplicate_email = $database->has("tbl_users",["email" => $email]);

    if ($duplicate_email) {
      $result['update'] = "true";
    } else {
      $user_id = $database->insert('tbl_users', [
        'username' => $username,
        'email' => $email,
        'pic' => $picUrl,
        'isProfileUpdated' => 1,
        'role'  => 'gmail'
      ]);
        
    }
    $query = "SELECT user_id FROM `tbl_users` where email='".$email."'";
    $ret = $database->query($query)->fetchAll();

    $result['success'] = "true";
    $result['user_id'] = $ret[0]['user_id'];
    echo json_encode($result);
  }
} else {
  header("HTTP/1.1 405 Method Not Allowed");
}
?>
