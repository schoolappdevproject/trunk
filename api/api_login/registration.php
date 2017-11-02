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
  $mobile = trim($_POST['mobile']);
  $profile_pic_data = $_POST['profile_pic_data'];

  
  $filepath = 'profile_pic/'.$email.'.jpg';  

  $profile_pic_data = explode(',',$profile_pic_data);
    
  if(false ==  file_put_contents($filepath, base64_decode($profile_pic_data[1])))  
  {    
      $log->info("failed to save file ");
      $filepath = "";
  }
   

  $log->info("Registration data");
  $log->info($username);
  $log->info($email);
  $log->info($mobile);


  if(empty($username) || empty($email) || empty($password)){
    header("HTTP/1.1 400 Bad Request");
  } else {
    $result = [];

    $duplicate_username = $database->has("tbl_users",["username" => $username]);
    $duplicate_email = $database->has("tbl_users",["email" => $email]);

    if($duplicate_username) {
      $result['error'] = "Username already exists!";
      $log->info("Username already exist");
    } else if ($duplicate_email) {
      $result['error'] = "Email already registered!";
      $log->info("email already exist");
    } else {

      $fileactualPath = "api/api_login/".$filepath;
      $user_id = $database->insert('tbl_users', [
        'username' => $username,
        'email' => $email,
        'password' => $password,
        'mobile' => $mobile,
        'pic'    => $fileactualPath,
        'role'  => 'user',
        'isProfileUpdated' => 0
      ]);

      $log->info($user_id);

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
