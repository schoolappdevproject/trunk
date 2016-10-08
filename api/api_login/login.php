<?php

include_once '../common/connection.php';
require("../trace/MyLogPHP-1.2.1.class.php");

$method = $_SERVER['REQUEST_METHOD'];
$log = new MyLogPHP();
if ($method == 'POST') {

  $username = trim($_POST['username']);
//  $email = trim($_POST['email']);
  $password = md5(trim($_POST['password']));
 
  $log->info("Login Request Username $username Password $password");
  if(empty($username) || empty($password)){
    $log->info("HTTP/1.1 400 Bad Request");
    header("HTTP/1.1 400 Bad Request");
  } else {
    $result = [];

    $validate_user = $database->get("tbl_users",[
      "password","email","username","user_id"
    ],[
      "OR" => [
        "username" => $username,
        "email" => $username
      ]
    ]);

    if($validate_user) {
      if($validate_user['password'] == $password) {
        $result['success'] = "login successfull";
        $result['code']    = "1";
        $result['email']   = $validate_user['email'];
        $result['username'] = $validate_user['username'];
        $result['user_id'] = $validate_user['user_id'];
          
      } else {
        $result['error'] = "Wrong password";
        $result['code']    = "0";
      }
    } else {
      $result['error'] = "Wrong username or, email";
      $result['code']    = "0";
    }
    $log->info($result);
    echo json_encode($result);
  }
} else {
  header("HTTP/1.1 405 Method Not Allowed");
}

?>
