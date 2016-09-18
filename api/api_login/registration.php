<?php

include_once '../common/connection.php';
require("../trace/MyLogPHP-1.2.1.class.php");
include_once 'mailconfig.php';
$log = new MyLogPHP();
$method = $_SERVER['REQUEST_METHOD'];

if ($method == 'POST') {
  $username = trim($_POST['username']);
  $email    = trim($_POST['email']);
  $password = md5(trim($_POST['password']));
    


  if(empty($username) || empty($email) || empty($password)){
    header("HTTP/1.1 400 Bad Request");
  } else {
    $result = [];

    $duplicate_username = $database->has("tbl_users",["username" => $username]);
    $duplicate_email = $database->has("tbl_users",["email" => $email]);

    if($duplicate_username) {
      $result['error'] = "Username already exists!";
    } else if ($duplicate_email) {
      $result['error'] = "Email already registered!";
    } else {
      $user_id = $database->insert('tbl_users', [
        'username' => $username,
        'email' => $email,
        'password' => $password,
        'isProfileUpdated' => 0
      ]);

      if($user_id){
          
            $log->info("User username "+ $username +" email "+$email+" added SUCCESS");
            //send confirmation mail
            $mail->addAddress($email, $username);
            $mail->Subject = 'Registration confirmation mail.';
            $mail->Body    = 'Hi <b>'. $username .'</b> Thanks for registering with us.';
            $mail->AltBody = 'Hi '. $username .' Thanks for registering with us.';

            if(!$mail->send()) {
              $log->info("User username "+ $username +" email "+$email+" email sent SUCCESS");
              $result['mailError'] = "Mail could not be sent.";
            } else {
                $log->info("User username "+ $username +" email "+$email+" email sent FAILED");
              $result['mailSuccess'] = 'Message has been sent.';
            }
            $result['code']    = "1";
      } else {
            $log->info("User username "+ $username +" email "+$email+" added FAILED");
            $log->info(" Error : "+$result['error']);
            $result['code']    = "0";
      }
    }
    echo json_encode($result);
  }
} else {
  header("HTTP/1.1 405 Method Not Allowed");
}
?>
