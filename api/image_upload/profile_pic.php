<?php 


include_once '../common/connection.php';
require("../trace/MyLogPHP-1.2.1.class.php");

$log = new MyLogPHP();



      /*var profileData = {
                      'name'           : user_info.username,
                      'type'           : 'png',
                       'data'          :profilePicData
                };*/

$file_name = $_POST['name'];
$type      = $_POST['type'];
$data      = $_POST['data'];

try
{
    $filepath = 'prof_pic/'.$file_name.'.'.$type;    
    $log->info(file_put_contents($filepath, base64_decode($data)));
    
    
    //database save 
     $school_id = $database->update('tbl_users', [
        'pic'     => $filepath
    ],[
	   "username[=]" => $file_name
    ]);
    
    if ($school_id) {
       $log->info("Profile Pictorial uploaded succesfully at path ".$filepath);       
    } else {
       $log->info("Profile Pictorial uploaded failed at path ".$filepath);       
    }
    
} 
catch(Exception $ex)
{
       $log->info(" Error : ".$ex->getMessage());
}
       $log->info("image updated ");

?>