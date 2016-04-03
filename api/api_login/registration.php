<?php
include_once 'connection.php';
include_once 'mailconfig.php';

$method = $_SERVER['REQUEST_METHOD'];

if ($method == 'POST') {
  $username = trim($_POST['username']);
  $email = trim($_POST['email']);
  $password = md5(trim($_POST['password']));

  if(empty($username) || empty($email) || empty($password)){
    header("HTTP/1.1 400 Bad Request");
  } else {
    $result = [];

    $duplicate_username = $database->has("users",["username" => $username]);
    $duplicate_email = $database->has("users",["email" => $email]);

    if($duplicate_username) {
      $result['error'] = "Username already exists!";
    } else if ($duplicate_email) {
      $result['error'] = "Email already registered!";
    } else {
      $user_id = $database->insert('users', [
        'username' => $username,
        'email' => $email,
        'password' => $password
      ]);

      if($user_id){
        //send confirmation mail
        $mail->addAddress($email, $username);
        $mail->Subject = 'Registration confirmation mail.';
        $mail->Body    = 'Hi <b>'. $username .'</b> Thanks for registering with us.';
        $mail->AltBody = 'Hi '. $username .' Thanks for registering with us.';

        if(!$mail->send()) {
          $result['mailError'] = "Mail could not be sent.";
        } else {
          $result['mailSuccess'] = 'Message has been sent.';
        }

        $result['success'] = "Regiatration successfull!";
      } else {
        $result['error'] = "Something went wrong! Please try again.!";
      }
    }
    echo json_encode($result);
  }
} else {
  header("HTTP/1.1 405 Method Not Allowed");
}
?>
