<?php
include_once 'connection.php';
$method = $_SERVER['REQUEST_METHOD'];

if ($method == 'POST') {
  $username = trim($_POST['username']);
  $email = trim($_POST['email']);
  $password = md5(trim($_POST['password']));

  if(empty($username) || empty($email) || empty($password)){
    header("HTTP/1.1 400 Bad Request");
  } else {
    $result = [];

    $validate_user = $database->get("users",[
      "password"
    ],[
      "OR" => [
        "username" => $username,
        "email" => $email
      ]
    ]);

    if($validate_user) {
      if($validate_user['password'] == $password) {
        $result['success'] = "login successfull";
      } else {
        $result['error'] = "Wrong password";
      }
    } else {
      $result['error'] = "Wrong username or, email";
    }

    echo json_encode($result);
  }
} else {
  header("HTTP/1.1 405 Method Not Allowed");
}

?>
