<?php
include_once '../common/connection.php';
require("../trace/MyLogPHP-1.2.1.class.php");
$method = $_SERVER['REQUEST_METHOD'];
$log = new MyLogPHP();
if ($method == 'POST') {
  $name      = $_POST['name'];
  $address   = $_POST['address'];
  $contact   = $_POST['contact'];
  $email     = $_POST['email'];
  $city      = $_POST['city'];
  $country   = $_POST['country'];
  $isParent  = $_POST['isParent'];
  $user_name   = $_POST['user_name'];
    

try{
      $school_id = $database->update('tbl_users', [
        'city'     => $city,
        'role'     => "account",
        'address'  => $address,
        'city'     => $city,
        'email'   => $email,
        'country'  => $country,
        'mobile'  => $contact,
        'isParent' => $isParent,
        'isProfileUpdated' =>1 
      ],[
        "username[=]" => $user_name 
       ]);

      if ($school_id)
      {   
        $result['success'] = "profile Updated";
      } else {
        $result['error'] = "Some thing wrong happend";
        $log->info(var_dump($database->error()));
      }

}
catch(Exception $e){
    $log->info($e->getMessage());
}

} else {
  header("HTTP/1.1 405 Method Not Allowed");
}

?>
